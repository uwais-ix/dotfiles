#!/usr/bin/env python3

from __future__ import annotations
from dataclasses import dataclass
from datetime import datetime, time
from pathlib import Path

import argparse
import os
import subprocess
import sys

try:
  import tomllib
except Exception:
  print("Error: python 3.xx+ required (tomllib)", file=sys.stderr)
  sys.exit(2)
  
CONFIG_PATH = Path.home() / ".config" / "redshift" / "profiles" / "profiles.toml"
  # /run lock wiped at boot (transient)
LOCK = Path("/run/user") / str(os.getuid()) / "rdshft_override.lock"
global_cfg: dict = {}
profiles: dict = {}
###############################################################################################

### config ####################################################################################3
@dataclass(frozen=True)
class Profile:
  name: str
  temp: int
  brightness: float
  gamma: str
  start: str | None = None
  end: str | None = None

def load_config() -> tuple[dict, dict[str, Profile]]:
  if not CONFIG_PATH.exists():
    raise FileNotFoundError(f"config not found: {CONFIG_PATH}")
  
  data = tomllib.loads(CONFIG_PATH.read_text(encoding="utf-8"))
  global_cfg = data.get("global", {})
  profs_raw = data.get("profiles") or {}
  profiles : dict[str, Profile] = {}
  
  for name, cfg in profs_raw.items():
    profiles[name] = Profile(
      name=name,
      temp=int(cfg["temp"]),
      brightness=float(cfg["brightness"]),
      gamma=str(cfg["gamma"]),
      start=cfg.get("start"),
      end=cfg.get("end"),
    )
  return global_cfg, profiles

def profile_na(ns: argparse.Namespace) -> int:
  print(f"unknown profile: {ns.name}", file=sys.stderr)
  print(f"available profiles:", file=sys.stderr)
  list_profiles(ns)
  return 2

def list_profiles(ns: argparse.Namespace) -> int:
    for name, p in profiles.items():
        timing = f" ({p.start}-{p.end})" if p.start and p.end else ""
        print(f"{name}{timing}  temp={p.temp}  brightness={p.brightness}  gamma={p.gamma}")
    return 0

### time utils ################################################################################
def parse_hhmm(s:str) -> time:
  hh, mm = s.split(":")
  return time(int(hh), int(mm))

def in_range(now: time, start: time, end: time) -> bool:
  # start, end inclusive
  # (transition; start of day -> end of day; 07:00 -> 23:00)
  if start <= end:
    return start <= now <= end
  
  # (transition; end of day -> start of day; 23:00 -> 05:00)
  return now >= start or now<= end

def get_now_profile() -> Profile:
  now = datetime.now().time()
  default_name = global_cfg.get("default_profile")
  default_profile = profiles[default_name] if default_name and default_name in profiles else None
  return next((p for p in profiles.values() if p.start and p.end and in_range(now, parse_hhmm(p.start), parse_hhmm(p.end))), default_profile)

### lock/file utils ########################################################################
def write_lock(path: Path, content: str = "1") -> None:
  path.parent.mkdir(parents=True, exist_ok=True)
  path.write_text(content, encoding="utf-8")

def remove_lock(path: Path) -> None:
  try:
    path.unlink()
  except FileNotFoundError:
    pass

###########################################################################################
@dataclass(frozen=True)
class ArgSpec:
  args: tuple[str, ...]
  kwargs: dict[str, any]

@dataclass(frozen=True)
class SubSpec:
  name: str
  help: str
  handler: callable[[argparse.Namespace], int]
  args: tuple[ArgSpec, ...] = ()

def run(profile: Profile, lock=False, reset=False) -> int:
  cmd = global_cfg.get("redshift_cmd", "redshift")
  
  lat, lon = (global_cfg.get(k) for k in ("lat", "lon"))
  loc_args = ["-l", f"{lat}:{lon}"] if lat is not None and lon is not None else []

  args = [
          cmd,
          # "-x", # reset mode
          "-P", # reset gamma ramps
          *loc_args,
          "-O", str(profile.temp), # color temp
          "-b", f"{profile.brightness}:{profile.brightness}",
          "-g", profile.gamma,
      ]

  if reset: remove_lock(LOCK)
  subprocess.run(args, check=True)
  if lock: write_lock(LOCK)
  return 0

sub_parsers: tuple[SubSpec] = (
  SubSpec(
    name="apply",
    help="apply scheduled profile; timer uses this",
    handler= lambda ns: (0 if LOCK.exists() else run(get_now_profile()))
  ),
  SubSpec(
    name="set",
    help="apply profile; transient",
    args=(ArgSpec(("name",), {"help": "profile name"}),),
    handler= lambda ns: (profile_na(ns) if ns.name not in profiles else run(profiles[ns.name]))
  ),
  SubSpec(
    name="force",
    help="apply and lock profile; force",
    args=(ArgSpec(("name",), {"help": "profile name"}),),
    handler= lambda ns: (profile_na(ns) if ns.name not in profiles else run(profiles[ns.name], lock=True))
  ),
  SubSpec(
    name="reset",
    help="reset",
    handler= lambda ns: run(get_now_profile(), reset=True)
  ),
  SubSpec(
    name="list",
    help="list",
    handler= lambda ns: list_profiles(ns)
  )
)

def main() -> int:
  global global_cfg, profiles
  global_cfg, profiles = load_config()

  ap = argparse.ArgumentParser(description="redshfit profile scheduler")
  sub = ap.add_subparsers(dest="cmd", required=True)
  
  for sc in sub_parsers:
    p = sub.add_parser(sc.name, help=sc.help)
    for a in sc.args:
      p.add_argument(*a.args, **a.kwargs)
    p.set_defaults(function=sc.handler)
    
  namespace = ap.parse_args()
  return namespace.function(namespace)
  
  
##########################################################################################  
  
if __name__ == "__main__":
    raise SystemExit(main())

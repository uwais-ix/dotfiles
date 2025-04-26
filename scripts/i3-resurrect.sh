#!/bin/bash

# script to save entire session instead of standalone i3-resurrect workspace/profiles
#
# $1 action (save or restore)
# $2 session-dir name (defaults to default)
base_dir=$HOME/.i3
action=$1
session=${2:-default}
dir=$base_dir/$session

# i3-resurrect stores two config files per workspace 
# as xxx_workspacename_programs.json and xxx_workspacename_layout.json
# invalid filename chars are trimmed such as ></\..
# workspace name such as >> or / or > become __ instead of _>>_ or  _/_ or _>_ (respectively)
# saving workspace >> and workspace > would both save as xxx__xx.json
# the latest ^^saved workspace would overwrite xxx__xx.json
# 
#
#
# solution
# name of workspace can be found in xxx__xx.json {name: ">>"}
# rename xxx__xx.json to xxx_timestamp__xx.json to prevent save from being overwritten 
# parse json and restore sessions based on workspace {name: ""}
# restore xxx__xx.json name for i3-resurrect restore -w workspace
# comment / remove these if not using ></\.. in workspace name
#
#
# add or restore date(ms) timestamp
# optional param ($1) date(ms) as _timestamp__ | restores timestamp (restoring session)
# o/w adds new timestamp (first save)
bypassname(){
  repl=${1:-_$(date +%s%5N)__}
  rename '__' $repl $dir/workspace__programs.json 2>/dev/null 
  rename '__' $repl $dir/workspace__layout.json 2>/dev/null
}
#
# removes timestamp (restoring session)
# from _date__ ($1) to __
renameto(){
  rename $1 '__' $dir/*programs.json 2>/dev/null 
  rename $1 '__' $dir/*layout.json 2>/dev/null
}

save(){
  # delete previous session
  rm -r $dir 2>/dev/null
  for workspace in $(i3-msg -t get_workspaces | jq -r '.[].name'); do
    i3-resurrect save -w $workspace -d $dir
    # rename any xxx__xx.json
    bypassname
  done
}

restore(){
  for profile in $dir/*; do
    # find _timestamp__
    repl=$(echo $profile | grep -o '_.*__') 

    # remove any _timestamp__
    [[ -n $repl ]] && renameto $repl && profile=$(echo $profile | sed "s/${repl}/__/")

    # restore workspace
    workspace=$(jq -er 'select(type == "object" and has("name") and .name != null) | .name' $profile) && i3-resurrect restore -w $workspace -d $dir 

    # restore _timestamp__
    [[ -n $repl ]] && bypassname $repl
  done
}


# actions
case $action in
  save) 
    save
    ;;
  restore)
    restore
    ;;
  *) 
    echo error
    ;;
esac

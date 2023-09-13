local Terminal = require("toggleterm.terminal").Terminal

local get_term = function()
  local active = {}

  local function term(_name, _args)
    if active[_name] == nil then
      active[_name] = Terminal:new(_args)
    end
    return active[_name]
  end

  return term
end

local term = get_term()

function _uwais_toggleterm(name)
  local terminals = {
    btop = term("btop", { cmd = "btop", hidden = true }),
    htop = term("htop", { cmd = "htop", hidden = true }),
    lazygit = term("lazygit", { cmd = "lazygit", hidden = true }),
    node = term("node", { cmd = "node", hidden = true }),
    python = term("python", { cmd = "python", hidden = true }),
  }

  local terminal = terminals[name]
  if terminal == nil then
    vim.notify("Invalid name " .. name .. " _uwais_toggleterm", "error", {
      title = "_uwais_toggleterm",
    })
    return
  end

  terminal:toggle()
end

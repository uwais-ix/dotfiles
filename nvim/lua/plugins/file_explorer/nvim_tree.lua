local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)
  --
  local keymap = vim.keymap.set
  -- custom mappings
  keymap("n", "?", api.tree.toggle_help, opts("Help"))
  keymap("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
  keymap("n", "r", api.fs.rename, opts("Rename"))
  keymap("n", "<C-k>", api.node.show_info_popup, opts("Info"))
  keymap("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  keymap("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
  keymap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
  keymap("n", "<CR>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  keymap("n", "l", api.node.open.edit, opts("Open"))
  keymap("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
  keymap("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
  keymap("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
  keymap("n", ".", api.node.run.cmd, opts("Run Command"))
  keymap("n", "-", api.tree.change_root_to_parent, opts("Up"))
  keymap("n", "a", api.fs.create, opts("Create"))
  keymap("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
  keymap("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
  keymap("n", "c", api.fs.copy.node, opts("Copy"))
  keymap("n", "d", api.fs.remove, opts("Delete"))
  keymap("n", "D", api.fs.trash, opts("Trash"))
  keymap("n", "E", api.tree.expand_all, opts("Expand All"))
  keymap("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  keymap("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
  keymap("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
  keymap("n", "p", api.fs.paste, opts("Paste"))
  keymap("n", "P", api.node.navigate.parent, opts("Parent Directory"))
  keymap("n", "q", api.tree.close, opts("Close"))
  keymap("n", "R", api.tree.reload, opts("Refresh"))
  keymap("n", "W", api.tree.collapse_all, opts("Collapse"))
  keymap("n", "x", api.fs.cut, opts("Cut"))
  keymap("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
  keymap("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
  keymap("n", "F", api.live_filter.clear, opts("Clean Filter"))
end

return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    local nvim_tree = require("nvim-tree")
    nvim_tree.setup({
      on_attach = my_on_attach,
      disable_netrw = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
      },
    })
  end,
}

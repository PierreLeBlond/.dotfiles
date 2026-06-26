[LazyVim](https://www.lazyvim.org/)

[Course book](https://lazyvim-ambitious-devs.phillips.codes/course/chapter-1/)

#### Keep explorer open and switch back to previous buffer

from https://stackoverflow.com/a/79705083
```lua
local last_explored_win = nil

return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fe",
        false,
      },
      {
        "<leader>fe",
        function()
          local explorer_win = nil

          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            local ft = vim.bo[buf].filetype
            if ft == "snacks_picker_list" then
              explorer_win = win
              break
            end
          end

          if vim.api.nvim_get_current_win() ~= explorer_win and explorer_win then
            last_explored_win = vim.api.nvim_get_current_win()
            vim.api.nvim_set_current_win(explorer_win)
          elseif vim.api.nvim_get_current_win() == explorer_win and last_explored_win then
            vim.api.nvim_set_current_win(last_explored_win)
          else
            Snacks.explorer()
          end
        end,
        desc = "Switch Explorer NeoTree (root dir)",
      },
    },
  },
}
```

#### Svelte

##### LSP
from https://github.com/sveltejs/language-tools/issues/1458#issuecomment-2557887543
Use Mason (:Mason) to add svelte-langage-server
Add typescript-svelte-plugin to dev dependencies
##### Syntax highlighting 
https://github.com/sveltejs/language-tools/issues/1458#issuecomment-2557887543


local M = {}



M.blankline = {
    space_char_blankline = " ",
    show_current_context = true,
}

M.nvterm = {
   terminals = {
      list = {},
      type_opts = {
         float = {
            relative = "editor",
            row = 0.3,
            col = 0.3,
            width = 0.8,
            height = 0.8,
            border = "single",
         },
         horizontal = { location = "rightbelow", split_ratio = 0.3 },
         vertical = { location = "rightbelow", split_ratio = 0.5 },
      },
   },
}

M.treesitter = {
   ensure_installed = {
          "html",
          "css",
          "javascript",
          "json",
          "toml",
          "vim",
          "c",
          "markdown",
          "rust",
          "lua",
    },
			-- 增量选择/选中代码块（很好用，打开了）感觉比gcmt/wildfire.vim 好用
            -- 要使用 :TSInstall 安装对应语言的才生效。 不然安装html支持  :TSInstall html
			incremental_selection = {
				enable = true,
				keymaps = {
					-- 初始化选择
					init_selection = "<CR>",
					-- 递增
					node_incremental = "<CR>",
					-- 递减
					node_decremental = "<BS>",
					-- 选择一个范围
					scope_incremental = "<TAB>",
				},
			},
        }


M.nvimtree = {
   git = {
      enable = true,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },
}

return M

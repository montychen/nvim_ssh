--  S代表Shift键盘；s代表Command键，M或A代表option键盘, C代表Control键盘

-- Just an example, supposed to be placed in /lua/custom/

local user_plugins = require("custom.myplugins.myinit") -- 自己添加的插件/lua/custom/myplugins/myinit.lua
local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
	theme = "onedark",
}

M.options = {
	-- custom = {}
	-- general nvim/vim options , check :h optionname to know more about an option

	clipboard = "", -- 取消共享系统剪贴板。 在输入模式 s-v 也就是 Command + v 从系统剪贴板粘贴到vim
	tabstop = 4, -- tab 4个空格
    shiftwidth = 4,
    softtabstop = 4,
    autoindent = true,

	terminal = { -- A-i 浮动终端切换，定义终端显示大小
		location = {
			horizontal = "rightbelow",
			vertical = "rightbelow",
			float = {
				relative = "editor",
				row = 0.3,
				col = 0.25,
				width = 0.7,
				height = 0.7,
				border = "single",
			},
		},
	},
}

M.plugins = {
	install = user_plugins,

	-- enable/disable plugins (false for disable)
	status = {
		alpha = true, -- dashboard
	},

   options = {
      statusline = {
         shortline = true,
         style = "default", -- default, round , slant , block , arrow
       }
   },

	default_plugin_config_replace = {
		nvim_treesitter = {
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
		},
    },
}

return M

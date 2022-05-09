--  S代表Shift键盘；s代表Command键，M或A代表option键盘, C代表Control键盘

    local override = require "custom.override"
local user_plugins = require "custom.myplugins.myinit" -- 自己添加的插件/lua/custom/myplugins/myinit.lua
local M = {}

M.ui = {
	theme = "onedark",
}

M.options = {
        user = function ()
    	    vim.opt.clipboard = "" -- 取消共享系统剪贴板。 在输入模式 s-v 也就是 Command + v 从系统剪贴板粘贴到vim
    	    vim.opt.tabstop = 4 -- tab 4个空格
            vim.opt.shiftwidth = 4
            vim.opt.softtabstop = 4
            vim.opt.autoindent = true
            vim.opt.scrolloff = 4 -- 设定光标上下两侧最少保留的屏幕行数
        end,
}


M.plugins = {
	user = user_plugins,

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

 override = {
      ["NvChad/nvterm"] = override.nvterm,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
   },
}


return M

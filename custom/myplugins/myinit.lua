return {

	-- 中文输入法自动切换，需要手动先安装依赖xkbswitch-macosx依赖
	[ "rlue/vim-barbaric" ] = {},
--	[ 'lyokha/vim-xkbswitch'] = {     -- "中文自动输入法切换插件, 记得重启vim然后执行 :PlugInstall
--	  config = function()
--	    vim.g.XkbSwitchEnabled = 1
--	  end,
--	},

	-- 平滑滚动，定义的快捷键和vim习惯一致。 C-d/C-u;  C-e/C-y就可以向下、向上平滑滚动。
       ["psliwka/vim-smoothie"] = {},

	-- ["karb94/neoscroll.nvim"] = {
	-- 	opt = true,
	-- 	config = function() -- config 插件每次加载后运行
    --         require('neoscroll').setup()
			-- require("custom.myplugins.myconfig.neoscroll").setup()
            -- require('neoscroll').setup({})
            --     local t = {}
            --     -- Syntax: t[keys] = {function, {function arguments}}
            --         t['<C-u>'] = {'scroll', {'-10', 'true', '250'}}
            --         t['<C-d>'] = {'scroll', { '10', 'true', '250'}}
            --         t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
            --         t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450'}}
            --         t['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
            --         t['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
            --         t['zt']    = {'zt', {'250'}}
            --         t['zz']    = {'zz', {'250'}}
            --         t['zb']    = {'zb', {'250'}}
            --     require('neoscroll.config').set_mappings(t)
            --
		-- end,
	--
	-- 	-- -- lazy loading
	-- 	setup = function() -- setup 插件每次加载前运行
	-- 		nvchad.packer_lazy_load "neoscroll.nvim"
	-- 	end,
	-- },

	-- 历史修改记录  <A-u>
	-- ["mbbill/undotree"] ={
	-- 	opt = true,
	-- 	cmd = "UndotreeToggle",
	-- },


	-- 多光标、多选择
	["mg979/vim-visual-multi"] ={
		keys = "<C-n>",
	},

	-- 快速选中, 没有 nvim_treesitter自带的增量选择代码块 incremental_selection 好用
	-- {
	--   "gcmt/wildfire.vim",
	--   keys = "<CR>",
	-- },

	-- MarkdownPreview
	["plasticboy/vim-markdown"] = { --支持markdown编辑,
		ft = { "markdown" },
		require = { "godlygeek/tabular" },
	},
	["iamcco/markdown-preview.nvim"]={ -- 在md文件下运行 :MarkdownPreview 可实时预览
		ft = { "markdown" }, -- 打开的文件类型是markdown文件时，才加载该插件
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Hop 字词行快速定位跳转
	["phaazon/hop.nvim"]={
		load_file = true,
		cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2" },
		config = function()
			require("hop").setup()
		end,
	},


	-- 格式化 NvChad的<leader>fm shortcut 预设只在設妥lsp server 時才有作用，但null-ls format 不需要lsp server
	["jose-elias-alvarez/null-ls.nvim"]={
		after = "nvim-lspconfig",
		config = function()
			require("custom.myplugins.myconfig.null-ls").setup()
		end,
	},
	-- 代码格式化. 这个不好用，null-ls更好用
	-- {
	-- 	"sbdchd/neoformat",
	-- 	config = function()
	-- 		require("custom.myplugins.myconfig.neoformat")
	-- 	end,
	-- },

    -- 使用treesitter自动补全html标签
    ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         local present, autotag = pcall(require, "nvim-ts-autotag")

         if present then
            autotag.setup()
         end
      end,
   },


    ["nvim-neorg/neorg"] = {
      ft = "norg",
      after = "nvim-treesitter",
      config = function()
         require "custom.myplugins.myconfig.neorg"
      end,
   },


    -- 自动调暗不活动的窗口
  ["andreadev-it/shade.nvim"] = {
      config = function ()
           require'shade'.setup({
               overlay_opacity = 50,
               opacity_step = 1,
               keys = {
                 brightness_up    = '<C-Up>',
                 brightness_down  = '<C-Down>',
                 toggle           = '<Leader>s',
               },
               exclude_filetypes = { "neo-tree", "markdown" }
           })
      end,

   },


-- 貌似nvchad自带的终端<A-i>不好用。  试试这个浮动终端看看 自定义快捷键是<A-f>
   ["numToStr/FTerm.nvim"] = {
        config = function ()
            require'FTerm'.setup({
                border = 'double',
                dimensions  = {
                    height = 0.95,
                    width = 0.95,
                },
            })
        end,

        -- vim.keymap.set('n', '<A-f>', '<CMD>lua require("FTerm").toggle()<CR>')
        -- vim.keymap.set('t', '<A-f>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
   },

}


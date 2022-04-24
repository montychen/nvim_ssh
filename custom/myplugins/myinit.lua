return {

	-- 中文输入法自动切换，需要手动先安装依赖xkbswitch-macosx依赖
	{ "rlue/vim-barbaric" },
	-- { 'lyokha/vim-xkbswitch',      -- "中文自动输入法切换插件, 记得重启vim然后执行 :PlugInstall
	--   config = function()
	--     vim.g.XkbSwitchEnabled = 1
	--   end,
	-- },

	-- 平滑滚动，定义的快捷键和vim习惯一致。 C-d/C-u;  C-e/C-y就可以向下、向上平滑滚动。
	{
		"karb94/neoscroll.nvim",
		opt = true,
		config = function() -- config 插件每次加载后运行
			require("neoscroll").setup({})

			local t = {}
			-- Syntax: t[keys] = {function, {function arguments}}
			t["<C-u>"] = { "scroll", { "-10", "true", "150" } } -- 光标向上移动10行
			t["<C-d>"] = { "scroll", { "10", "true", "150" } } -- 光标向下移动10行
			t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } } -- 向上翻1页
			t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } } -- 向下翻1页
			t["<C-y>"] = { "scroll", { "-1", "false", "100" } } -- 屏幕向上翻1行
			t["<C-e>"] = { "scroll", { "1", "false", "100" } } -- 屏幕向下翻1行
			t["zt"] = { "zt", { "150" } } -- 把当前行移动到屏幕顶部
			t["zz"] = { "zz", { "150" } } -- 把当前行移动到屏幕中间
			t["zb"] = { "zb", { "150" } } -- 把当前行移动到屏幕底部

			require("neoscroll.config").set_mappings(t)
		end,

		-- lazy loading
		setup = function() -- setup 插件每次加载前运行
			require("core.utils").packer_lazy_load("neoscroll.nvim")
		end,
	},

	-- 历史修改记录  <A-u>
	{
		"mbbill/undotree",
		opt = true,
		cmd = "UndotreeToggle",
	},

	-- 多光标、多选择
	{
		"mg979/vim-visual-multi",
		keys = "<C-n>",
	},

	-- 快速选中, 没有 nvim_treesitter自带的增量选择代码块 incremental_selection 好用
	-- {
	--   "gcmt/wildfire.vim",
	--   keys = "<CR>",
	-- },



	-- 代码格式化.  要手动安装各个语言的格式化程序 https://github.com/sbdchd/neoformat#supported-filetypes
	-- {
	-- 	"sbdchd/neoformat",
	-- 	config = function()
	-- 		require("custom.myplugins.myconfig.neoformat")
	-- 	end,
	-- },

	-- MarkdownPreview
	{
		"plasticboy/vim-markdown", --支持markdown编辑,
		ft = { "markdown" },
		require = { "godlygeek/tabular" },
	},
	{
		"iamcco/markdown-preview.nvim", -- 在md文件下运行 :MarkdownPreview 可实时预览
		ft = { "markdown" }, -- 打开的文件类型是markdown文件时，才加载该插件
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

-- Hop 字词行快速定位跳转
    {
      "phaazon/hop.nvim",
        load_file = true,
        cmd = { "HopWord", "HopLine", "HopChar1", "HopChar2" },
        config = function()
           require("hop").setup()
        end,
   },


}

require("neoscroll").setup({})
	local t = {}
	-- Syntax: t[keys] = {function, {function arguments}}
	t["<C-u>"] = { "scroll", { "-10", "true", "150" } } -- 光标向上移动10行
	t["<C-d>"] = { "scroll", { "10", "true", "150" } } -- 光标向下移动10行
	t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } } -- 向上翻1页
	t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } } -- 向下翻1页
	t["<C-y>"] = { "scroll", { "-0.10", "false", "100" } } -- 屏幕向上翻1行
	t["<C-e>"] = { "scroll", { "0.10", "false", "100" } } -- 屏幕向下翻1行
	t["zt"] = { "zt", { "150" } } -- 把当前行移动到屏幕顶部
	t["zz"] = { "zz", { "150" } } -- 把当前行移动到屏幕中间
	t["zb"] = { "zb", { "150" } } -- 把当前行移动到屏幕底部

require("neoscroll.config").set_mappings(t)



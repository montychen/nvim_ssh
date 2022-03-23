-- WARN: telescope 手动安装依赖 fd 和 ripgrep
-- https://github.com/sharkdp/fd
-- https://github.com/BurntSushi/ripgrep

require("telescope").setup()

-- 查找文件: 在当面工作目录及子目录下查找. :pwd查看当前工作目录, :cd 可以进入新的工作目录
vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)

-- 查找文件: 在打开过的文件中查找 file open rencent
vim.keybinds.gmap("n", "<leader>fr", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)

-- 查找文件: 在当前打开的缓冲区中查找
vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)

-- 搜索光标下内容:  在当前工作目录及子目录下的文件中搜索
vim.keybinds.gmap("n", "<leader>fs", "<cmd>Telescope grep_string theme=dropdown<CR>", vim.keybinds.opts)


-- 查找 marks 标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)

-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)


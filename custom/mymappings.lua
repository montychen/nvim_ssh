-- S代表Shift键盘；s代表Command键，M代表option键盘, C代表Control键盘

local map = nvchad.map 
local M = {}

M.nvimtree = {
   n = {
      -- toggle 文件树
      ["<C-n>"] = "",  -- 默认toggle文件树是 <C-n>, 这里先取消
      ["<leader>1"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
   },
}

M.nvterm = {
    n = {
        -- 默认定义的这2个mapping始终创建新的·水平or垂直终端，不好用，这里把他俩取消
        ["<leader>h"] = "",
        ["<leader>v"] = "",
      },
}

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- 历史修改记录
map("n", "<A-u>", ":UndotreeToggle<CR>")


-- Hop 字词行快速定位跳转
map("n", "<leader>hc", ":HopChar1 <CR>")  -- <leader>hc 输入1个字符,就可以快速跳转到给字符的位置
map("n", "<leader>hw", ":HopWord <CR>")
map("n", "<leader>hl", ":HopLine <CR>")



-- -- 格式化
-- NvChad 的 <leader>fm shortcut 预设只在設妥 lsp server 時才有作用，但 null-ls format 不需要lsp server
map("n", "<leader>cf", ":lua vim.lsp.buf.formatting_sync() <CR>")

-- 不依赖插件的普通映射
map("n", "<C-a>", "ggVG") -- 全选
-- map("n", "<C-k>", "d$") -- 从当前光标位置一直删除到行尾

return M

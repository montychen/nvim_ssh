-- S代表Shift键盘；s代表Command键，M代表option键盘, C代表Control键盘

local M = {}

M.nvimtree = {
   n = {
      -- toggle 文件树
      ["<C-n>"] = "",  -- 默认toggle文件树是 <C-n>, 这里先取消
      ["<leader>1"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
   },
}

-- M.nvterm = {
--     n = {
--         -- 默认定义的这2个mapping始终创建新的·水平or垂直终端，不好用，这里把他俩取消
--         ["<leader>h"] = "",
--         ["<leader>v"] = "",
--       },
-- }

M.hop = {  -- Hop 字词行快速定位跳转
    n = {

        ["<leader>hc"] = {"<cmd>HopChar1<CR>", "Hop Char1"},
        ["<leader>hl"] = {"<cmd>HopLine<CR>", "Hop Line"},
    },
}


M.untotree={ -- 历史修改记录
    n = {
        ["<A-u>"] = {"<cmd>UndotreeToggle<CR>", "Undotree Toggle"},
    },
}


M.null_ls = {   -- NvChad 的 <leader>fm shortcut 预设只在設妥 lsp server 時才有作用，但 null-ls format 不需要lsp server
    n = {
        ["<leader>cf"] = {"<cmd>lua vim.lsp.buf.formatting_sync() <CR>", "code format"},
    },
}

M.shade = {
   n = {
      ["<leader>s"] = {
         function()
            require("shade").toggle()
         end,

         "   toggle shade.nvim",
      },
   },
}



-- 不依赖插件的普通映射
M.general = {
    n = {
        ["<C-a>"] = {"ggVG", "select all"},
        -- map("n", "<C-k>", "d$") -- 从当前光标位置一直删除到行尾
    },
}



return M

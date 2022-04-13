-- S代表Shift键盘；s代表Command键，M代表option键盘, C代表Control键盘

local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- 历史修改记录
map("n", "<A-u>", ":UndotreeToggle<CR>")

-- 文件树
map("n", "<leader>1", ":NvimTreeToggle<CR>")

-- 格式化
map("n", "<leader>cf", ":Neoformat<CR>")

-- 不依赖插件的普通映射
map("n", "<C-a>", "ggVG") -- 全选
map("n", "<C-k>", "d$") -- 从当前光标位置一直删除到行尾

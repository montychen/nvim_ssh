return require('packer').startup({function()
  use 'wbthomason/packer.nvim'   -- packer can manage itself

-- 用use列出要安装的插件
  use 'mhinz/vim-startify'        -- 启动页列出最近打开的文件 
  use 'rlue/vim-barbaric'      -- 中文输入法自动切换，需要手动安装xkbswitch-macosx依赖，见下文
  -- use 'lyokha/vim-xkbswitch'      -- 另一个中文自动输入法切换插件, 也需要安装系统依赖

  use { 'plasticboy/vim-markdown', ft = {'markdown'},           --支持markdown编辑, 
        require = {'godlygeek/tabular'}   }                     -- vim-markdown依赖tabular插件
  use { 'iamcco/markdown-preview.nvim',  ft = {'markdown'},     -- 在md文件下运行 :markdownpreview 可实时预览
        run = function()      -- run 是插件安装后或者新版本更新后运行
            vim.fn['mkdp#util#install']()
        end  }   -- 打开的文件类型是markdown文件时，才加载该插件

--  use { 'tomtom/tcowment_vim' }               -- 注释插件   当前行 gcc or gc（选中模式）

-- 状态栏statusline没化. vim-airline太复杂没有lualine好用
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
     config = function()
        require("conf.lualine")
    end
}

  -- use { "vim-airline/vim-airline",            -- 这个太复杂了.状态栏美化插件lualine更好用
  --       requires = { "vim-airline/vim-airline-themes",
  --       "ryanoasis/vim-devicons" }}  --图标插件，支持vim-airline, lightline, vim-startify；要放在vim-airline后面


  use "kevinhwang91/rnvimr" --悬浮文件管理ranger, mac先安装系统依赖。hjkl ctrl-t新tab ctrl-x水平ctrl-v垂直打开文件

  -- use { "junegunn/fzf", run = function() vim.fn['fzf#install']() end }  -- telescope 更好用. 模糊查找神器: 内容，文件...
  -- use 'junegunn/fzf.vim'

  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}


    -- vim中文文档
            use {
                "yianwillis/vimcdoc",
            }


 -- nvim-tree
use {
    "kyazdani42/nvim-tree.lua",
    requires = {         -- 依赖一个图标插件
        "kyazdani42/nvim-web-devicons"
    },
    config = function()        -- config 是每次插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
        require("conf.nvim-tree")
    end
}


-- 优秀的暗色主题
use {
    "catppuccin/nvim",
    -- 改个别名，因为它的名字是 nvim，可能会冲突
    as = "catppuccin",
    config = function()     -- config 是每次插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
        require("conf.catppuccin")
    end
}

-- 支持 lsp 状态的 buffer 栏
use {
    "akinsho/bufferline.nvim",
    requires = {
        "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
    },
    config = function()
        require("conf.bufferline")
    end
}



-- 搜索时显示条目
use {
    "kevinhwang91/nvim-hlslens",
    config = function()
        require("conf.nvim-hlslens")
    end
}

-- 显示缩进线
use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("conf.indent-blankline")
    end
}


-- 自动匹配括号
use {
    "windwp/nvim-autopairs",
    config = function()
        require("conf.nvim-autopairs")
    end
}


-- 字词行快速定位跳转
use {
    "phaazon/hop.nvim",
    config = function()
        require("conf.hop")
    end
}

-- 自动恢复光标位置
use {
    "ethanholz/nvim-lastplace",
    config = function()
        require("conf.nvim-lastplace")
    end
}

-- 自动恢复上次布局会话
-- use {
--     "rmagatti/auto-session",
--     config = function()
--         require("conf.auto-session")
--     end
-- }


-- 项目范围内全局替换
use {
    "nvim-pack/nvim-spectre",
    requires = {
        "nvim-lua/plenary.nvim", -- lua 开发模块
        "burntsushi/ripgrep" -- 文字查找
    },
    config = function()
        require("conf.nvim-spectre")
    end
}


-- 多光标模式
  use {'mg979/vim-visual-multi', branch = 'master'}


-- 语法高亮
use {
    "nvim-treesitter/nvim-treesitter",
    run = {":tsupdate"},
    requires = {
        "p00f/nvim-ts-rainbow" -- 彩虹括号
    },
    config = function()
        require("conf.nvim-treesitter")
    end
}

-- 代码注释
use {
    "numtostr/comment.nvim",
    requires = {
        "joosepalviste/nvim-ts-context-commentstring"
    },
    config = function()
        require("conf.comment")
    end
}


-- css或者网页中显示16进制数字代表的颜色 "#AB9DF2"
use {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("conf.nvim-colorizer")
    end
}


-- 内置终端
use {
    "akinsho/toggleterm.nvim",
    config = function()
        require("conf.toggleterm")
    end
}


-- 快捷键查看
use {
    "folke/which-key.nvim",
    config = function()
        require("conf.which-key")
    end
}



-- 模糊查找
use {
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim", -- Lua 开发模块
        "BurntSushi/ripgrep", -- 文字查找
        "sharkdp/fd" -- 文件查找
    },
    config = function()
        require("conf.telescope")
    end
}



-- 消息通知提醒: 精美弹窗
use {
    "rcarriga/nvim-notify",
    config = function()
        require("conf.nvim-notify")
    end
}


-- todo tree
use {
    "folke/todo-comments.nvim",
    config = function()
        require("conf.todo-comments")
    end
}


-- LSP 基础服务
-- use {
--     "neovim/nvim-lspconfig",
--     config = function()
--         require("conf.nvim-lspconfig")
--     end
-- }
--
-- -- 自动安装指定的LSP语言服务器
-- use {
--     "williamboman/nvim-lsp-installer",
--     config = function()
--         require("conf.nvim-lsp-installer")
--     end
-- }
--
-- -- LSP UI 美化
-- use {
--     "tami5/lspsaga.nvim",
--     config = function()
--         require("conf.lspsaga")
--     end
-- }
--
-- -- LSP 进度提示
-- use {
--     "j-hui/fidget.nvim",
--     config = function()
--         require("conf.fidget")
--     end
-- }
--
--




end,
        -- Packer 使用浮动窗口
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }},


-- plugins.lua文件修改实时生效配置


    vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
})

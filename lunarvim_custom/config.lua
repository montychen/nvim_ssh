--  S代表Shift键盘；s代表Command键，M或A代表option键盘, C代表Control键盘

vim.opt.showtabline = 4 -- always show tabs
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.clipboard = "" -- 在输入模式，用Command + v 从系统剪贴板粘贴到vim;  "+y 注意前面的双引号"也要,从vim复制到系统剪贴板复制
-- vim.opt.wrap = true -- display lines as one long line


-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>" -- 保存文件
lvim.keys.normal_mode["<C-a>"] = "ggVG" -- 全选
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"


-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
lvim.keys.normal_mode["<C-k>"] = "d$" -- 从光标位置一直删除到行尾

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }


-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }
lvim.builtin.which_key.mappings["m"] = {
    name = "My映射",
    p = { "<cmd>MarkdownPreview<CR>", "Markdown 预览" },
    h = { "<cmd>HopChar1<CR>", "Hop Char1" },
}





-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    -- "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    -- "java",
    "yaml",
    "html",
    "markdown",
    "vim",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.treesitter.incremental_selection = {   -- 增量选择/选中代码块（很好用，打开了）
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
}

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
    "sumneko_lua",
    "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = true

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    --     {
    --       "folke/trouble.nvim",
    --       cmd = "TroubleToggle",
    --     },
    { "rlue/vim-barbaric" }, -- 中文输入法自动切换，需要手动先安装依赖xkbswitch-macosx依赖
    -- { "psliwka/vim-smoothie" }, -- 平滑滚动，定义的快捷键和vim习惯一致。 C-d/C-u;  C-e/C-y就可以向下、向上平滑滚动。
    {
        "karb94/neoscroll.nvim", -- 平滑滚动，定义的快捷键和vim习惯一致。 C-d/C-u;  C-e/C-y就可以向下、向上平滑滚动。
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                easing_function = "quadratic" -- Default easing function
                -- Set any other options as needed
            })

            local t    = {}
            -- Syntax: t[keys] = {function, {function arguments}}
            -- Use the "sine" easing function
            t['<C-u>'] = { 'scroll', { '-10', 'true', '250', [['sine']] } }
            t['<C-d>'] = { 'scroll', { '10', 'true', '250', [['sine']] } }
            -- Use the "circular" easing function
            t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450', [['circular']] } }
            t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450', [['circular']] } }
            -- Pass "nil" to disable the easing animation (constant scrolling speed)
            t['<C-y>'] = { 'scroll', { '-0.10', 'false', '100', nil } }
            t['<C-e>'] = { 'scroll', { '0.10', 'false', '100', nil } }

            t['zt'] = { 'zt', { '250' } }
            t['zz'] = { 'zz', { '250' } }
            t['zb'] = { 'zb', { '250' } }

            require('neoscroll.config').set_mappings(t)
        end
    },

    {
        "iamcco/markdown-preview.nvim", -- 在md文件下运行 :MarkdownPreview 可实时在浏览器里预览
        run = "cd app && npm install",
        ft = "markdown", -- 打开的文件类型是markdown文件时，才加载该插件
        config = function()
            -- vim.g.mkdp_auto_start = 1
        end,
    },

    {
        "phaazon/hop.nvim", -- Hop 字词行快速定位跳转
        event = "BufRead",
        config = function()
            require("hop").setup()
        end,
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.json", "*.jsonc", "*.md" },
    -- enable wrap mode for json files only
    command = "setlocal wrap",
})
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

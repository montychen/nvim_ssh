   local null_ls = require("null-ls")
local b = null_ls.builtins

-- all null-ls built-in sources   https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
	-- javascript / css / json / yaml
	b.formatting.prettier,
	b.diagnostics.eslint,
	b.diagnostics.stylelint,
	b.diagnostics.jsonlint,
	b.diagnostics.yamllint,

	-- markdown
	b.formatting.markdownlint,
	b.diagnostics.markdownlint,

	-- c/c++
	b.formatting.clang_format,
	b.diagnostics.cppcheck,

	-- python
	b.formatting.black.with({
		command = vim.fn.expand("~/.local/bin/black"),
	}),
	b.diagnostics.pylint,

	-- golang
	b.formatting.gofmt,
	b.formatting.goimports,
	b.diagnostics.golangci_lint,

	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- yaml
	b.diagnostics.yamllint,

	-- terraform
	b.formatting.terraform_fmt,


    --- ==== blow test by 大军 is ok! can work ===================
    
	-- Rust
	b.formatting.rustfmt,

	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),
}

local M = {}

M.setup = function()
	null_ls.setup({
		debug = true,
		sources = sources,

		-- format on save
		-- on_attach = function(client)
		--    if client.resolved_capabilities.document_formatting then
		--       vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
		--    end
		-- end,
	})
end

return M

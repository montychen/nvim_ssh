local null_ls = require("null-ls")
local b = null_ls.builtins

-- all null-ls built-in sources   https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
    -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },

	-- markdown
	b.formatting.markdownlint,
	b.diagnostics.markdownlint,

	-- c/c++
	b.formatting.clang_format,
	b.diagnostics.cppcheck,


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

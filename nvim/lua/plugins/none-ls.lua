return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.completion.spell,
				require("none-ls.diagnostics.eslint_d"),
			},
			-- null-ls always advertises range-formatting support, which makes
			-- Neovim default 'formatexpr' to the LSP formatter on attach,
			-- breaking gq for prose (prettier doesn't wrap markdown).
			-- Overriding formatexpr in on_attach is the documented way to
			-- customize it (:h vim.lsp.formatexpr); <leader>gf is unaffected
			-- since whole-buffer formatting doesn't go through formatexpr.
			on_attach = function(_, bufnr)
				if vim.bo[bufnr].filetype == "markdown" then
					vim.bo[bufnr].formatexpr = ""
				end
			end,
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
                cpp = { "clang-format" },
                c = { "clang-format" },
			},
		})
		vim.keymap.set("n", "<Leader>cf", function()
			conform.format({ async = true, lsp_fallback = true })
		end, {})
	end,
}

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	config = function()
		require("render-markdown").setup({
			ft = { "markdown", "quarto" },
		})
		vim.keymap.set("n", "<Leader>emd", ":RenderMarkdown toggle<CR>", {})
	end,
}

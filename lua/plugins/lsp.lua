return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependancies = {
			"mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = {
					["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					["<CR>"] = cmp.mapping(
						cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
						{ "i", "c" }
					),
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
			})

			require("lspconfig").clangd.setup({
				capabilities = capabilities,
			})
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
			})
		end,
	},
}

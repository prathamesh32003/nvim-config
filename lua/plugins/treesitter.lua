return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            auto_install = true,
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                    keymaps = {
                        init_selection = "<Leader>v",
                        node_incremental = "<TAB>",
                        scope_incremental = "<Leader><TAB>",
                        node_decremental = "<S-TAB>",
                    },
            },
        })
    end
}

return { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    opts = {
        ensure_installed = {"lua", "javascript"},
        highlighting = { enable = true },
        indenting = { enable = true },
    },
}

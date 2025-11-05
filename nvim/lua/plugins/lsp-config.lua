return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "html",
                    "jdtls",
                    "clangd",
                    "bashls",
                    "pylsp",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls", {})
            vim.lsp.config("ts_ls", {})
            vim.lsp.config("html", {})
            vim.lsp.config("jdtls", {})
            vim.lsp.config("clangd", {})
            vim.lsp.config("bashls", {})
            vim.lsp.config("pylsp", {})
            vim.lsp.enable({"lua_ls", "ts_ls", "html", "jdtls", "clangd", "bashls", "pylsp"})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

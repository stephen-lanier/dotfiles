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
            -- Configure LSP servers using new vim.lsp.config API
            vim.lsp.config("*", {
                root_markers = { ".git" },
            })

            -- Enable specific LSP servers
            local servers = { "lua_ls", "ts_ls", "html", "jdtls", "clangd", "bashls", "pylsp" }
            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}

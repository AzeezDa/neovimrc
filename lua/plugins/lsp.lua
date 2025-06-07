return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls"
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                vim.keymap.set('n', 'K', function()
                    vim.lsp.buf.hover {
                        border = 'rounded',
                    }
                end, { buffer = event.buf })
            end,
        })

        vim.diagnostic.config({
            underline = true,
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = ""
            },
        })
    end
}

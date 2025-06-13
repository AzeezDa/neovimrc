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
                vim.lsp.inlay_hint.enable(true)
                vim.lsp.codelens.refresh();
            end,
        })

        vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost', 'TextChanged' }, {
            callback = function ()
                vim.schedule(function()
                    vim.lsp.codelens.refresh();
                end)
            end})
    end
}

return {
    "sindrets/diffview.nvim",
    config = function ()
       vim.keymap.set("n", "gvo", "<cmd> DiffviewOpen <CR>")
       vim.keymap.set("n", "gvc", "<cmd> DiffviewClose <CR>")
    end

}

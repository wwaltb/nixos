return {
    {
        "mini-nvim",
        lazy = false,
        keys = {
            { "<C-s>", require("mini.files").open },
        },
        after = function()
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.files").setup({
                mappings = {
                    close = "<Esc>",
                }
            })
            require("mini.pick").setup()
            require("mini.icons").setup()
            require("mini.starter").setup()
            require("mini.statusline").setup()
        end,
    },
}

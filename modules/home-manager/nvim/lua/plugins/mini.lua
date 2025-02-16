return {
    {
        "mini-ai",
        after = function()
            require("mini.ai").setup()
        end,
    },
    {
        "mini-comment",
        after = function()
            require("mini.comment").setup()
        end,
    },
    {
        "mini-files",
        keys = {
            { "<C-s>", require("mini.files").open },
        },
        after = function()
            require("mini.files").setup({
                mappings = {
                    close = "<Esc>",
                }
            })
        end,
    },
    {
        "mini-pick",
        after = function()
            require("mini.pick").setup()
        end,
    },
    {
        "mini-icons",
        after = function()
            require("mini.icons").setup()
        end,
    },
    {
        "mini-starter",
        after = function()
            require("mini.starter").setup()
        end,
    },
    {
        "mini-statusline",
        after = function()
            require("mini.statusline").setup()
        end,
    },
}

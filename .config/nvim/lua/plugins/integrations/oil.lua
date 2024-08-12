-- Oil Files and Folders Management
return {
    "stevearc/oil.nvim",

    opts = {},

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("oil").setup({
            use_default_keymaps = false,

            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["sl"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                ["sj"] = {
                    "actions.select",
                    opts = { horizontal = true },
                    desc = "Open the entry in a horizontal split",
                },
                ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["-"] = "actions.parent",
            },
        })
    end,
}

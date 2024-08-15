-- Zen Mode configurations
return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",

    opts = {
        plugins = {
            gitsigns = true,
            wezterm = {
                enabled = true,
                font = "+4",
            },
        },
    },

    keys = { { "<leader>z", "<CMD>ZenMode<CR>", desc = "Zen Mode" } },
}

return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
        plugins = {
            gitsigns = true,
        },
    },
    keys = { { "<leader>z", "<CMD>ZenMode<CR>", desc = "Zen Mode" } },
}

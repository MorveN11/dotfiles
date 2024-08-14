-- Buffer line: Tabs Management
return {
    "akinsho/bufferline.nvim",

    event = "VeryLazy",

    keys = {
        { "<Tab>", "<CMD>BufferLineCycleNext<CR>", desc = "Next tab" },
        { "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },

    opts = {
        options = {
            mode = "tabs",
            show_buffer_close_icons = false,
            show_close_icon = false,
        },
    },
}

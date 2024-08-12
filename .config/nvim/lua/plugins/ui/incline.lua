-- Top Right File Name and Icon
return {
    "b0o/incline.nvim",

    dependencies = {},

    event = "BufReadPre",

    priority = 1200,

    config = function()
        local helpers = require("incline.helpers")

        require("incline").setup({
            highlight = {
                groups = {
                    InclineNormal = { guibg = "#1F1F28", guifg = "#DCD7BA" },
                    InclineNormalNC = { guifg = "#1F1F28", guibg = "#DCD7BA" },
                },
            },

            window = {
                padding = 0,
                margin = { horizontal = 0 },
            },

            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

                if vim.bo[props.buf].modified then
                    filename = "[+] " .. filename
                end

                local icon, color = require("nvim-web-devicons").get_icon_color(filename)

                local buffer = {
                    icon and { " ", icon, " ", guibg = color, guifg = helpers.contrast_color(color) } or "",
                    { " " },
                    { filename },
                    { " " },
                }

                return buffer
            end,
        })
    end,
}

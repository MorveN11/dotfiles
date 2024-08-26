-- Status bottom line
local colors = {
    white = "#1F1F28",
    black = "#DCD7BA",
    green = "#7AA89F",
    red = "#C34043",
    orange = "#FFA066",
    grey = "#363646",
    light_green = "#98BB6C",
    info = "#7E9CD8",
    hint = "#7FB4CA",
}

local theme = {
    normal = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.white },
        z = { fg = colors.white, bg = colors.black },
    },
    insert = { a = { fg = colors.white, bg = colors.light_green } },
    visual = { a = { fg = colors.white, bg = colors.orange } },
    replace = { a = { fg = colors.white, bg = colors.green } },
}

local empty = require("lualine.component"):extend()

function empty:draw(default_highlight)
    self.status = ""
    self.applied_separator = ""
    self:apply_highlights(default_highlight)
    self:apply_section_separators()
    return self.status
end

local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < "x"
        for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
            table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= "table" then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = "" } or { left = "" }
        end
    end
    return sections
end

local function search_result()
    if vim.v.hlsearch == 0 then
        return ""
    end
    local last_search = vim.fn.getreg("/")
    if not last_search or last_search == "" then
        return ""
    end
    local searchcount = vim.fn.searchcount({ maxcount = 9999 })
    return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
    if vim.bo.modified then
        return "+"
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return "-"
    end
    return ""
end

local config = {
    options = {
        theme = theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            "neo-tree",
            "copilot-chat",
        },
    },

    sections = process_sections({
        lualine_a = { "mode" },

        lualine_b = {
            { "branch", color = { fg = colors.black } },

            "diff",

            {
                "diagnostics",
                source = { "nvim" },
                sections = { "error" },
                diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
            },
            {
                "diagnostics",
                source = { "nvim" },
                sections = { "warn" },
                diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
            },
            {
                "diagnostics",
                source = { "nvim" },
                sections = { "info" },
                diagnostics_color = { info = { bg = colors.info, fg = colors.white } },
            },
            {
                "diagnostics",
                source = { "nvim" },
                sections = { "hint" },
                diagnostics_color = { hint = { bg = colors.hint, fg = colors.white } },
            },

            { "filename", file_status = false, path = 0, color = { fg = colors.black } },

            { modified, color = { bg = colors.red } },

            {
                "%w",
                cond = function()
                    return vim.wo.previewwindow
                end,
                color = { fg = colors.black },
            },

            {
                "%r",
                cond = function()
                    return vim.bo.readonly
                end,
                color = { fg = colors.black },
            },

            {
                "%q",
                cond = function()
                    return vim.bo.buftype == "quickfix"
                end,
                color = { fg = colors.black },
            },
        },

        lualine_c = {},
        lualine_x = {},
        lualine_y = { { search_result, color = { fg = colors.black } }, { "filetype", color = { fg = colors.black } } },
        lualine_z = { "%l:%c", "%p%%/%L" },
    }),
    inactive_sections = {
        lualine_c = { "%f %y %m" },
        lualine_x = {},
    },
}

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = config,
}

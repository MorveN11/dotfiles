-- Setup Formatters for Conform
return {
    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = {
            xml = { "xmlformat" },
        },
    },
}

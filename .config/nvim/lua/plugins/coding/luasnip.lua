-- Snippets Configuration

return {
    "L3MON4D3/LuaSnip",

    build = "make install_jsregexp",

    config = function()
        local ls = require("luasnip")

        ls.add_snippets("cpp", require("custom-snippets.cpp"))
    end,
}

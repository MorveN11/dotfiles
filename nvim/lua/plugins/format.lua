return {
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, _)
			local nls = require("null-ls")

			local sources = {
				nls.builtins.formatting.sql_formatter.with({ command = { "sleek" } }),
				nls.builtins.formatting.black,
				nls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" } }),
			}

			nls.setup({
				debug = true,
				sources = sources,
			})
		end,
	},
}

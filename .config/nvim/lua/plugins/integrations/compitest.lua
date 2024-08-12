--  Competitive Programming
return {
    "xeluxee/competitest.nvim",

    dependencies = "MunifTanjim/nui.nvim",

    config = function()
        require("competitest").setup({
            testcases_use_single_file = true,
            testcases_directory = "./testcases",
        })
    end,
}

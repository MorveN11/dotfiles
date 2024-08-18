--  Competitive Programming
return {
    "xeluxee/competitest.nvim",

    dependencies = "MunifTanjim/nui.nvim",

    config = function()
        require("competitest").setup({
            compile_command = {
                c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
                cpp = { exec = "g++", args = { "-Wall", "-DLOCALDEB", "$(FNAME)", "-o", "$(FNOEXT)" } },
                rust = { exec = "rustc", args = { "$(FNAME)" } },
                java = { exec = "javac", args = { "$(FNAME)" } },
            },
            testcases_use_single_file = true,
            testcases_directory = "./testcases",
        })
    end,
}

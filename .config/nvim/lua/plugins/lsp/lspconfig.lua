-- LSP Servers Configuration
return {
    "neovim/nvim-lspconfig",

    opts = {
        inlay_hints = { enabled = false },

        servers = {
            yamlls = {
                settings = {
                    yaml = {
                        keyOrdering = false,
                    },
                },
            },

            omnisharp = {
                cmd = {
                    "dotnet",
                    "/home/morven/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
                },

                settings = {
                    FormattingOptions = {
                        EnableEditorConfigSupport = true,
                        OrganizeImports = true,
                    },
                    MsBuild = {
                        LoadProjectsOnDemand = true,
                    },
                    RoslynExtensionsOptions = {
                        EnableAnalyzersSupport = true,
                        EnableImportCompletion = true,
                        AnalyzeOpenDocumentsOnly = true,
                    },
                    Sdk = {
                        IncludePrereleases = true,
                    },
                },
            },

            tailwindcss = {
                root_dir = function(...)
                    return require("lspconfig.util").root_pattern(".git")(...)
                end,
            },

            tsserver = {
                root_dir = function(...)
                    return require("lspconfig.util").root_pattern(".git")(...)
                end,

                single_file_support = false,

                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "literal",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },

                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            },

            lua_ls = {
                single_file_support = true,

                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },

                        completion = {
                            workspaceWord = true,
                            callSnippet = "Both",
                        },

                        misc = {
                            parameters = {},
                        },

                        hint = {
                            enable = true,
                            setType = false,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },

                        doc = {
                            privateName = { "^_" },
                        },

                        type = {
                            castNumberToInteger = true,
                        },

                        diagnostics = {
                            disable = { "incomplete-signature-doc", "trailing-space" },
                            groupSeverity = {
                                strong = "Warning",
                                strict = "Warning",
                            },
                            groupFileStatus = {
                                ["ambiguity"] = "Opened",
                                ["await"] = "Opened",
                                ["codestyle"] = "None",
                                ["duplicate"] = "Opened",
                                ["global"] = "Opened",
                                ["luadoc"] = "Opened",
                                ["redefined"] = "Opened",
                                ["strict"] = "Opened",
                                ["strong"] = "Opened",
                                ["type-check"] = "Opened",
                                ["unbalanced"] = "Opened",
                                ["unused"] = "Opened",
                            },
                            unusedLocalExclude = { "_*" },
                        },

                        format = {
                            enable = false,
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "2",
                                continuation_indent_size = "2",
                            },
                        },
                    },
                },
            },
        },

        setup = {},
    },
}

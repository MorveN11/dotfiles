-- NeoTree configuration

return {
    "nvim-neo-tree/neo-tree.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    opts = {
        hide_root_node = true,

        default_component_configs = {
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "✹",
                    deleted = "✖",
                    renamed = "➜",
                    untracked = "★",
                    ignored = "☒",
                    unstaged = "✭",
                    staged = "✚",
                    conflict = "⚑",
                },
            },
        },

        filesystem = {
            filtered_items = {
                visible = false,
                show_hidden_count = false,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = true,
                hide_by_name = {
                    ".git",
                    "node_modules",
                    "coverage",
                    ".cache",
                    ".DS_Store",
                    "thumbs.db",
                    ".gradle",
                    ".settings",
                    ".classpath",
                    ".project",
                    "bin",
                    "build",
                    "obj",
                    ".idea",
                },
            },
        },

        window = {
            position = "right",
            mappings = {
                ["<leader>i"] = "image_wezterm",
            },
        },

        commands = {
            image_wezterm = function(state)
                local node = state.tree:get_node()
                if node.type == "file" then
                    require("image_preview").PreviewImage(node.path)
                end
            end,
        },
    },
}

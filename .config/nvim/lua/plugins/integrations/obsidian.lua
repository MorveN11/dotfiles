-- Setup Obsidian for Notes Management
return {
    "epwalsh/obsidian.nvim",
    version = "*",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        workspaces = {
            {
                name = "notes",
                path = "/home/morven/notes",
            },
        },

        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },

        notes_subdir = "inbox",
        new_notes_location = "inbox",

        attachments = {
            img_folder = "attachments",
        },

        dayli_notes = {
            template = "note",
        },

        mappings = {
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,

                opts = { noremap = false, expr = true, buffer = true },
            },
        },

        note_frontmatter_func = function(note)
            local out = { id = note.id, aliases = note.aliases, tags = note.tags }

            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,

        note_id_func = function(title)
            local suffix = ""

            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end

            return tostring(os.time()) .. "-" .. suffix
        end,

        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M:%S",
        },
    },
}

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
    },
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        -- Install core parsers at startup
        ts.install({
            "bash",
            "c",
            "cpp",
            "comment",
            "fish",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "javascript",
            "json",
            "latex",
            "lua",
            "luadoc",
            "make",
            "markdown",
            "markdown_inline",
            "norg",
            "python",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "typst",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
        }, {
            max_jobs = 8,
        })

        local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

        local ignore_filetypes = {
            "checkhealth",
            "lazy",
            "mason",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_win",
            "noice",
        }

        -- Register the Feral parser BEFORE setup()
        require("nvim-treesitter.parsers").feral = {
            install_info = {
                url = "https://github.com/Feral-Lang/tree-sitter-feral",
                files = "src/parser.c",
                branch = "main",
                generate = false,
                generate_from_json = false,
                queries = "queries/feral",
            },
            -- filetype = "feral",
        }

        -- Filetype detection
        vim.filetype.add({
            extension = {
                fer = "feral",
                fecl = "feral",
            },
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            desc = "Enable treesitter highlighting",
            pattern = { "*" },
            callback = function(event)
                if vim.tbl_contains(ignore_filetypes, event.match) then
                    return
                end

                local lang = vim.treesitter.language.get_lang(event.match) or event.match
                local buf = event.buf

                -- Install missing parsers (async, no-op if already installed)
                -- ts.install({ lang })

                -- start highlight immediately (works as long as parser exists)
                pcall(vim.treesitter.start, buf, lang)

                -- Enable treesitter indentation
                -- vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}

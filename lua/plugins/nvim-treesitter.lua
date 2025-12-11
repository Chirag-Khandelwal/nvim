return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    main = "nvim-treesitter.config",
    build = ":TSUpdate",
    opts = {
        lazy = false,
        auto_install = true,
        indent = { enable = true, disable = { 'ruby' } },
        highlight = {
            enable = true,
            -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
            --  If you are experiencing weird indenting issues, add the language to
            --  the list of additional_vim_regex_highlighting and disabled languages for indent.
            additional_vim_regex_highlighting = { 'ruby' }
        },
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "fish",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
        }
    }
}

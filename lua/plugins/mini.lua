return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
        require("mini.icons").setup({
            use_file_extension = function(ext, file)
                return true
            end,
        })
        require("mini.statusline").setup({
            use_icons = vim.g.have_nerd_font,
        })
        require("mini.tabline").setup({
            use_icons = vim.g.have_nerd_font,
        })
    end,
}

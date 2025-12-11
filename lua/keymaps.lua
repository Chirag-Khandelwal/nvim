local snacks = require("snacks")
local telescopeBuiltin = require("telescope.builtin")
local telescopeThemes = require("telescope.themes")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Hover keymap
vim.keymap.set("n", "<C-Space>", function()
    vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
end, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>l<leader>", function()
    vim.lsp.buf.hover({ border = "single", max_height = 25, max_width = 120 })
end, { desc = "Hover documentation" })

-- Work with windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Work with buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Move focus to the left buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Move focus to the right buffer" })
vim.keymap.set("n", "<leader>bd", function()
    snacks.bufdelete()
end, { desc = "Current [B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bD", function()
    snacks.bufdelete.other()
end, { desc = "Current [B]uffer [D]elete Others" })

vim.keymap.set("n", "<leader>fh", telescopeBuiltin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader>fk", telescopeBuiltin.keymaps, { desc = "[F]ind [K]eymaps" })
vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fs", telescopeBuiltin.builtin, { desc = "[F]ind [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", telescopeBuiltin.grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "[F]ind by [G]rep" })
vim.keymap.set("n", "<leader>fd", telescopeBuiltin.diagnostics, { desc = "[F]ind [D]iagnostics" })
vim.keymap.set("n", "<leader>fr", telescopeBuiltin.resume, { desc = "[F]ind [R]esume" })
vim.keymap.set("n", "<leader>f.", telescopeBuiltin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", telescopeBuiltin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    telescopeBuiltin.current_buffer_fuzzy_find(telescopeThemes.get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
-- See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>f/", function()
    telescopeBuiltin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
    })
end, { desc = "[F]ind [/] in Open Files" })

-- Shortcut for searching the Neovim configuration files
vim.keymap.set("n", "<leader>fn", function()
    telescopeBuiltin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[F]ind [N]eovim files" })

vim.g.mapleader = " "
-- ruined by NvimTree I think
-- vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

-- Panes Stuff --
-- moving between panes
vim.keymap.set("n", "<leader>h", "<C-W>h")
vim.keymap.set("n", "<leader>j", "<C-W>j")
vim.keymap.set("n", "<leader>k", "<C-W>k")
vim.keymap.set("n", "<leader>l", "<C-W>l")

-- Resizing pands
vim.keymap.set("n", "<leader>+", "<C-W>3+")
vim.keymap.set("n", "<leader>-", "<C-W>3-")
vim.keymap.set("n", "<leader>>", "<C-W>3<")
vim.keymap.set("n", "<leader><", "<C-W>3>")



-- copy paste stuff --
--
-- copy line without newline
vim.keymap.set("n", "yn", "0vg_y")
-- in visual mode, shortcut for g_
vim.keymap.set("v", "<C-0>", "g_")
-- past below current line
vim.keymap.set("n", "<C-p>", "o<Esc>p")



-- Searching --
-- Stop highlight for search
vim.keymap.set("n", "<leader>s", ":noh<cr>")


-- Line num --
-- Toggle between abs and relative line nums
ABS_NUMBER = false
line_num_fn = function()
    if ABS_NUMBER then
        vim.cmd(':set nonumber')
        vim.cmd(':set relativenumber')
        ABS_NUMBER = false
    else
        vim.cmd(':set norelativenumber')
        vim.cmd(':set number')
        ABS_NUMBER = true
    end
end
vim.keymap.set("n", "<leader>0", line_num_fn)




lua << EOF
vim.api.nvim_set_keymap(
    "v",
    "<leader>z",
    ":lua require('refactoring').select_refactor()<CR>",
    { noremap = true, silent = true, expr = false }
)
EOF

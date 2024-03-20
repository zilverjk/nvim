-- Cerrar eslint_d al salir de neovim
vim.cmd([[
    augroup KillEslintDOnExit
        autocmd!
        autocmd VimLeave * !pkill -f eslint_d
    augroup END
]])

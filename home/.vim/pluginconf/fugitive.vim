"Git status
nnoremap <silent> <leader>gs :Gstatus<CR>
"Git diff
nnoremap <silent> <leader>gd :Gdiff<CR>
"Git commit
nnoremap <silent> <leader>gc :Gcommit<CR>
"Git blame
nnoremap <silent> <leader>gb :Gblame<CR>
"Git log
nnoremap <silent> <leader>gl :Glog<CR>
"Git push
nnoremap <silent> <leader>gp :Git push<CR>
"Git read
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

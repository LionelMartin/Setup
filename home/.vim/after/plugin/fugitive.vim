"Git status
nnoremap <silent> <leader>gs :Gstatus<CR>
let g:which_key_map.g.s = 'git-status'
"Git diff
nnoremap <silent> <leader>gd :Gdiff<CR>
let g:which_key_map.g.d = 'git-diff'
"Git commit
nnoremap <silent> <leader>gc :Gcommit<CR>
let g:which_key_map.g.c = 'git-commit'
"Git blame
nnoremap <silent> <leader>gb :Gblame<CR>
let g:which_key_map.g.b = 'git-blame'
"Git log
nnoremap <silent> <leader>gl :Glog<CR>
let g:which_key_map.g.l = 'git-log'
"Git push
nnoremap <silent> <leader>gp :Git push<CR>
let g:which_key_map.g.p = 'git-push'
"Git read
nnoremap <silent> <leader>gr :Gread<CR>
let g:which_key_map.g.r = 'git-read'
nnoremap <silent> <leader>gw :Gwrite<CR>
let g:which_key_map.g.w = 'git-write'
nnoremap <silent> <leader>ge :Gedit<CR>
let g:which_key_map.g.e = 'git-edit'
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
let g:which_key_map.g.e = 'git-add-interactive'
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

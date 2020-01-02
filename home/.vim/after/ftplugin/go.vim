Shortcut Run current test file
    \ nnoremap <leader>tu  <Plug>(go-test-split)
Shortcut Run current file
    \ nnoremap <leader>ru  <Plug>(go-run-split)
Shortcut Go to alternate file
    \ nnoremap <leader>a  <Plug>(go-alternate)
Shortcut Show code coverage
    \ nnoremap <leader>co  <Plug>(go-coverage)
let g:go_auto_sameids = 1
set noexpandtab "go uses tabs
set foldmethod=syntax
let g:go_updatetime = 500
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_test_show_name = 1 "Show the name of the failed test before its log
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')

if has_key(g:plugs, 'deoplete.vim')
	call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
endif

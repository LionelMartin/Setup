nmap <leader>tt  <Plug>(go-test)
let g:which_key_map.t.t="run-tests"
nmap <leader>tf  <Plug>(go-test-function)
let g:which_key_map.t.t="test-function"
nmap <leader>tc  <Plug>(go-coverage-toggle)
let g:which_key_map.t.c="test-coverage"

nmap <leader>ii <Plug>(go-info)
let g:which_key_map.i.i="show-info"
nmap <leader>fm <Plug>(go-implements)
let g:which_key_map.f.m="find-implements"
nmap <leader>fc <Plug>(go-callers)
let g:which_key_map.f.c="find-callers"
nmap <leader>fd <Plug>(go-def)
let g:which_key_map.f.d="find-definition"
nmap <leader>er <Plug>(go-rename)
let g:which_key_map.e.r="edit-rename"

let g:go_auto_sameids = 1
setlocal noexpandtab "go uses tabs
setlocal shiftwidth=4                " Use indents of x spaces
setlocal tabstop=4                   " An indentation every x columns
setlocal softtabstop=4               " Let backspace delete indent
setlocal foldmethod=syntax
let g:go_updatetime = 500

"handled by gofmt plugin instead of vim-go
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_test_show_name = 1 "Show the name of the failed test before its log

let g:gofmt_exe = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'revive']

command! -buffer -bang A  call go#alternate#Switch(<bang>0, 'edit')
command! -buffer -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -buffer -bang AS call go#alternate#Switch(<bang>0, 'split')

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

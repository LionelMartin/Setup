nmap <leader>tt  <Plug>(go-test)
nmap <leader>tf  <Plug>(go-test-function)
nmap <leader>ru  <Plug>(go-run-split)
nmap <leader>a   <Plug>(go-alternate)
nmap <leader>tc  <Plug>(go-coverage-toggle)

nmap <leader>ii <Plug>(go-info)
nmap <leader>im <Plug>(go-implements)
nmap <leader>ic <Plug>(go-callers)
nmap <leader>id <Plug>(go-def)

let g:go_auto_sameids = 0
setlocal noexpandtab "go uses tabs
setlocal foldmethod=syntax
let g:go_updatetime = 500

"handled by gofmt plugin instead of vim-go
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_test_show_name = 1 "Show the name of the failed test before its log

let g:gofmt_exe = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'revive']

command! -buffer A call go#alternate#Switch(<bang>0, 'edit')

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

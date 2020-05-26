nmap <leader>tf  <Plug>(go-test-split)
nmap <leader>ru  <Plug>(go-run-split)
nmap <leader>a  <Plug>(go-alternate)
nmap <leader>tc  <Plug>(go-coverage-toggle)

let g:go_auto_sameids = 0
set noexpandtab "go uses tabs
set foldmethod=syntax
let g:go_updatetime = 500
"handled by gofmt plugin instead of vim-go
let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_test_show_name = 1 "Show the name of the failed test before its log

let g:gofmt_exe = "goimports"

command! -buffer A call go#alternate#Switch(<bang>0, 'edit')
command! -buffer AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -buffer AS call go#alternate#Switch(<bang>0, 'split')

call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

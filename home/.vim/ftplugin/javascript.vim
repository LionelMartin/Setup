" Declare the general config group for autocommand
augroup javascript
    autocmd!
augroup END

" javascript {
    let g:used_javascript_libs = 'jquery'
    let g:jsdoc_default_mapping = 0
" }
" Neomake {
    let g:neomake_javascript_enabled_makers=['jshint']
" }
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
Shortcut Document with jsDoc
    \ nnoremap <Leader>jd :JsDoc<cr>

" Declare the general config group for autocommand
augroup php
    autocmd!
augroup END

autocmd FileType php setlocal omnifunc=phpactor#Complete

" Phpactor {
    Shortcut Open Phpactor context menu
        \ nnoremap <leader>aa :call phpactor#ContextMenu()<CR>
    Shortcut PHP: add use statement
        \ nnoremap <leader>au :call phpactor#UseAdd()<CR>
    Shortcut PHP: invoke the navigation menu
        \ nnoremap <leader>an :call phpactor#Navigate()<CR>
    Shortcut PHP: go to the definition of the class or class member under the cursor
        \ nnoremap <leader>ag :call phpactor#GotoDefinition()<CR>
    Shortcut PHP: Transform the classes in the current file
        \ nnoremap <leader>at :call phpactor#Transform()<CR>
    Shortcut PHP: Generate a new class (replacing the current file)
        \ nnoremap <leader>ac :call phpactor#ClassNew()<CR>
    Shortcut PHP: Extract expression (normal)
        \ nnoremap <silent> <leader>ax :call phpactor#ExtractExpression(v:false)<CR>
    Shortcut PHP: Extract expression (visual)
        \ vnoremap <silent> <leader>ax :<C-U>call phpactor#ExtractExpression(v:true)<CR>
    Shortcut PHP: Extract method from selection
        \ vnoremap <silent> <leader>af :call phpactor#ExtractMethod()<CR>
" }
" Neomake {
    let g:neomake_php_enabled_makers=['php', 'phpcs']
    let g:neomake_php_phpcs_args_standard="Zend"
" }
" Skeletons {
    autocmd BufNewFile  *.php 0r ~/.config/nvim/skeletons/skeleton.php
" }
" get the test file associated to the current file {
  function! s:GetAssociatedTestFile()
     return 'tests/'.expand("%:r").'Test.php'
  endfunction
" }

" Launch unit tests {
  function! s:RunTestFile(file)
    if filereadable(a:file)
        exec 'AsyncRun '.g:phpunit_command.' '.a:file
    else
        echo 'file '.a:file.' not readable'
    endif
  endfunction
  function! RunCurrentTestFile()
    if stridx(@%, 'tests/') > -1
        call s:RunTestFile(@%))
    else
        call s:RunTestFile(s:GetAssociatedTestFile())
    endif
  endfunction
  " }

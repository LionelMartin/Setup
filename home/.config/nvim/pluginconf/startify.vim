let g:startify_change_to_dir = 0
let g:startify_custom_header =
      \ map(split(system('fortune | cowsay -f apt'), '\n'), '"   ". v:val') + ['']
let g:startify_custom_footer =
      \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

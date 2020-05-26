" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
let g:airline_exclude_preview = 1
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" allow term windows to be displayed in tab line
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#tabline#formatter = 'default'

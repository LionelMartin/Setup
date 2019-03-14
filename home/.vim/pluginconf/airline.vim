" See `:echo g:airline_theme_map` for some more choices
" Default in terminal vim is 'dark'
let g:airline_exclude_preview = 1
if !exists('g:airline_theme')
    let g:airline_theme = 'tomorrow'
endif
let g:airline_powerline_fonts = 1
if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let g:airline_left_sep=''  " Slightly fancier than '>'
    let g:airline_right_sep='' " Slightly fancier than '<'
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

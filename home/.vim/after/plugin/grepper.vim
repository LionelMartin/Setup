let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.jump = 0
let g:grepper.next_tool = '<leader>ss'
let g:grepper.tools = ['git', 'ag', 'ack', 'grep', 'findstr', 'sift', 'pt']
"Search in files
nnoremap <leader>ss :Grepper<CR>
let g:which_key_map.s.s = 'search-file'
"Search word under cursor in files
nnoremap <leader>s* :Grepper -cword -noprompt<CR>
let g:which_key_map.s["*"] = 'search-cursor'

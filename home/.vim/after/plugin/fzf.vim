"Find files
nnoremap <leader>ff :Files<CR>
let g:which_key_map.f.f = 'find-file'
"Find buffers
nnoremap <leader>fb :Buffers<CR>
let g:which_key_map.f.b = 'find-buffer'
"Find tags
nnoremap <leader>ft :Tags<CR>
let g:which_key_map.f.t = 'find-tag'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

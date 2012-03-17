" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
  " reload vimrc if changed
  autocmd bufwritepost .vimrc source ~/.vimrc
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		
" Pour highlighter la ligne courante (pour mieux se repérer) en bleu :
set cursorline
highlight CursorLine ctermbg=gray

"touche leader plus accessible
map <Leader> = ","


colorscheme mustang

" et pour la coloration du shell :
let g:is_posix = 1

"gestion lignes trop longues
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%100v.\+/

set preserveindent
" Use 4 spaces for <Tab> and :retab
set tabstop =4 
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround
" Use 4 spaces for (auto)indent
set shiftwidth =4
set softtabstop =4
set expandtab "remplace les tabs par des espaces
" numeros de lignes
set number
"permettre l'utilisation de backspace dans tous les cas
set backspace=2 
set wrapscan "recherche en rond
" taille max d'une ligne
set textwidth=100

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Insert mode completion options
set completeopt=menu,longest,preview

"Enter selects highlighted completion menu item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>': '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=1000

" shebang automatique lors de l'ouverture nouveau
" " d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
:autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\"|1put=\"# -*- coding: UTF8 -*-\<nl>\<nl>\"|$

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

"do php lint after saving a php file
"au BufWritePost *.php !php -l %

" lien vers doc php
:autocmd FileType php set keywordprg=pman

" use my bashrc in vim command mode
set shell=bash\ --login

" insertion de phpdoc
source ~/.vim/plugin/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

"edit vimrc in new tab
nmap <Leader>ev :tabe ~/.vimrc<cr>

"change current directory to current file
"autocmd BufEnter * cd %:p:h

" completion php
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd Filetype js set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS 
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" dossier par défaut
:chdir $HOME/
set browsedir=current

" sauvegarder en tant que root:
command! Wroot :w !sudo tee %

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" save session on exit and restore it on load
function! RestoreSession()
  if argc() == 0 "vim called without arguments
    execute 'source ~/.vim/Session.vim'
  end
endfunction

autocmd VimEnter * call RestoreSession()

autocmd VimLeavePre * mksession! ~/.vim/Session.vim

" Tag list
" F4: Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
"project shortcut
"nmap <silent> <F2> <Plug>ToggleProject
nmap <silent> <F3> :NERDTreeToggle<CR>


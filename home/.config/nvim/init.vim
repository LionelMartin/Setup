if (!has('nvim'))
    set autoindent
    set autoread
    set backspace="indent,eol,start"
    set display="lastline"
    set encoding="utf8"
    set history=10000
    set hlsearch
    set incsearch
    set langnoremap
    set laststatus=2
    set mouse="a"
    set nocompatible
    set nrformats="bin,hex"
    set smarttab
    set ttyfast
    set wildmenu
endif

if filereadable(expand("~/.config/nvim/before.vim"))
    source ~/.config/nvim/before.vim
endif

" Use bundles config {
    if filereadable(expand("~/.config/nvim/bundles.vim"))
        source ~/.config/nvim/bundles.vim
    endif
" }

" General {
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    scriptencoding utf-8
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set virtualedit=onemore             " Allow for cursor beyond last character
    set nospell                         " Spell checking off
    set hidden                          " Allow buffer switching without saving
    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif
    set noswapfile
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
    set ttimeout
    set ttimeoutlen=0

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }
" }

" Vim UI {
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:␣ " Highlight problematic whitespace
    set completeopt=noinsert,menuone,noselect " don't insert automatically, display even when there is only one option, don't select automatically

    set guifont=DroidSansMono\ Nerd\ Font\ 10
    colorscheme Tomorrow-Night

    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" }

" Formatting {
    set nowrap                      " Do not wrap long lines
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
" }

" Folding {
    function! MyFoldText() " {{{
        let line = getline(v:foldstart)

        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction " }}}
    set foldtext=MyFoldText()
" }

" Key (re)Mappings {
    nnoremap Y y$

    " better fold move commands
    nnoremap zk zk[z
    nnoremap zK zk
    nnoremap zJ zj]z

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    Shortcut Saves as sudo
     \ cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>

    " Disable arrows
    noremap  <up> <nop>
    noremap  <down> <nop>
    noremap  <left> <nop>
    noremap  <right> <nop>

    let mapleader = " "

    inoremap jj <Esc>
    inoremap kk <Esc>

    nnoremap j gj
    nnoremap k gk

    " move easily through buffers
    nnoremap <C-h> :bp<cr>
    nnoremap <C-l> :bn<cr>

    Shortcut Edit vim config
        \ nnoremap <leader>ev :e $HOME/.config/nvim/init.vim<cr>
    Shortcut Reloads vim config
        \ nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<cr>

    "copy/paste from system clipboard
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P
" }

" Open Quickfix window when text is written in it {
    augroup vimrc
        autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(8, 1)
    augroup END
" }

" Source every plugin configs {
    for file in split(glob("~/nvim/pluginconf/*.vim"), '\n')
        exe 'source' file
    endfor
" }

" Plugins {
    " Normal Vim omni-completion {
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " }
    " length matters {
        let g:lengthmatters_start_at_column = 120
    " }
" }

" Functions {
    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }
" }

" Use local vimrc if available {
    if filereadable(expand("~/.config/nvim/local.vim"))
        source ~/.config/nvim/local.vim
    endif
" }

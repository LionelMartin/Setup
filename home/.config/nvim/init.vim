"
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
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set nospell                           " Spell checking off
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

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

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

    set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 10
    colorscheme Tomorrow-Night

    "Highlight long lines
    hi OverLength ctermbg=darkred ctermfg=white guibg=darkred
    match OverLength /\%120v.*/

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

    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " To disable the stripping of whitespace, add the following to your
    " .vimrc.before.local file:
    "   let g:spf13_keep_trailing_whitespace = 1
    "autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer>
    "if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" }
" Key (re)Mappings {

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>


    " better fold move commands
    nnoremap zk zk[z
    nnoremap zK zk
    nnoremap zJ zj]z

    function! MyFoldText() " {{{
        let line = getline(v:foldstart)

        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        " expand tabs into spaces
        let onetab = strpart(' ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')

        let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction " }}}
    set foldtext=MyFoldText()

    " fix tag jump for azerty keyboard
    nnoremap <C-g> <C-]>zo

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <Leader>ew :e %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Easier horizontal scrolling
    map zl zL
    map zh zH

    " Disable arrows
    noremap  <up> <nop>
    noremap  <down> <nop>
    noremap  <left> <nop>
    noremap  <right> <nop>

    let mapleader = " "

    inoremap jj <Esc>
    inoremap kk <Esc>

    nnoremap <Leader>jd :JsDoc<cr>

    " move easily through buffers
    nnoremap <C-h> :bp<cr>
    nnoremap <C-l> :bn<cr>

    nnoremap <leader>ve :e $HOME/.nvimrc<cr>
    nnoremap <leader>vs :source $HOME/.nvimrc<cr>

    "copy/paste from system clipboard
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P

    nnoremap <Leader>w :w<CR>
    cnoremap %z /usr/share/php/libzend-framework-php/Zend/
" }

" Plugins {
    " Misc {
        let b:match_ignorecase = 1
    " }
    " Git Gutter {
        let g:gitgutter_realtime = 0
        let g:gitgutter_eager = 0
    " }
    " Neomake {
        autocmd! BufWritePost * Neomake
        let g:neomake_python_enabled_makers=['flake8']
        let g:neomake_php_enabled_makers=['php', 'phpcs']
        let g:neomake_javascript_enabled_makers=['jshint']
        let g:neomake_php_phpcs_args_standard="Zend"
        let g:neomake_error_symbol = "✗"
        let g:neomake_warning_symbol = "⚠"
        let g:neomake_enable_balloons = 1
    " }
    " javascript {
        let tern#is_show_argument_hints_enabled = 1
        let g:used_javascript_libs = 'jquery'
        let g:jsdoc_default_mapping = 0
    " }
    " OmniComplete {
        " To disable omni complete, add the following to your .vimrc.before.local file:
        "   let g:spf13_no_omni_complete = 1
        if !exists('g:spf13_no_omni_complete')
            if has("autocmd") && exists("+omnifunc")
                autocmd Filetype *
                    \if &omnifunc == "" |
                    \setlocal omnifunc=syntaxcomplete#Complete |
                    \endif
            endif

            hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
            hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
            hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

            " Some convenient mappings
            inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
            inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
            inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
            inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
            inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
            inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

            " Automatically open and close the popup menu / preview window
            set completeopt=menu,preview,longest
        endif

    " }
    " Tabularize {
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }
    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
    " }
    " PyMode {
        let g:pymode_lint_checker = "pyflakes"
        let g:pymode_utils_whitespaces = 0
        let g:pymode_options = 0
    " }
    " ctrlp {
        let g:ctrlp_working_path_mode = 'ra'
        nnoremap <silent> <C-P> :CtrlPMRU<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

        " On Windows use "dir" as fallback command.
        if executable('ag')
            let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
        elseif executable('ack')
            let s:ctrlp_fallback = 'ack %s --nocolor -f'
        else
            let s:ctrlp_fallback = 'find %s -type f'
        endif
        let g:ctrlp_user_command = {
            \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': s:ctrlp_fallback
        \ }
    "}
    " TagBar {
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
    "}
    " PythonMode {
        " Disable if python support not present
        if !has('python')
            let g:pymode = 0
        endif
    " }
    " Fugitive {
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>
    "}
    " deoplete {
        let g:deoplete#enable_at_startup = 1
    " }
    " neocomplete {
        " let g:acp_enableAtStartup = 0
        " let g:neocomplete#enable_at_startup = 1
        " let g:neocomplete#enable_smart_case = 1
        " let g:neocomplete#enable_auto_delimiter = 1
        " let g:neocomplete#max_list = 15
        " let g:neocomplete#force_overwrite_completefunc = 1


        " " Define dictionary.
        " let g:neocomplete#sources#dictionary#dictionaries = {
        "             \ 'default' : '',
        "             \ 'vimshell' : $HOME.'/.vimshell_hist',
        "             \ 'scheme' : $HOME.'/.gosh_completions'
        "             \ }

        " " Define keyword.
        " if !exists('g:neocomplete#keyword_patterns')
        "     let g:neocomplete#keyword_patterns = {}
        " endif
        " let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        "     iunmap <CR>
        "     " <ESC> takes you out of insert mode
        "     inoremap <expr> <Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
        "     " <CR> accepts first, then sends the <CR>
        "     inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
        "     " <Down> and <Up> cycle like <Tab> and <S-Tab>
        "     inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
        "     inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
        "     " Jump up and down the list
        "     inoremap <expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        "     inoremap <expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
        " " <TAB>: completion.
        " inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

        " " Courtesy of Matteo Cavalleri

        " " Enable heavy omni completion.
        " if !exists('g:neocomplete#sources#omni#input_patterns')
        "     let g:neocomplete#sources#omni#input_patterns = {}
        " endif
        " let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        " let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
        " let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
        " let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    " }
    " Normal Vim omni-completion {
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
        autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
        autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
    " }
    " vim-airline {
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

    " }
    " php refactor {
        let g:php_refactor_command = "php ~/.homesick/repos/Setup/refactor.phar"
    " }
    " php-cs-fixer {
        let g:php_cs_fixer_fixers_list = "short_tag,function_call_space,function_declaration,linefeed,lowercase_constants,lowercase_keywords,method_argument_space,parenthesis,php_closing_tag,trailing_spaces,visibility,operators_spaces"
    " }
    " Startify {
        let g:startify_change_to_dir = 0
        let g:startify_custom_header =
              \ map(split(system('fortune | cowsay -f apt'), '\n'), '"   ". v:val') + ['']
        let g:startify_custom_footer =
              \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
        let g:startify_session_autoload       = 1
        let g:startify_session_persistence    = 1
        let g:startify_session_delete_buffers = 1
    " }
    " grepper {
        nnoremap <leader>s :Grepper<CR>
        let g:grepper = {}
        let g:grepper.open = 1
        let g:grepper.switch = 1
        let g:grepper.jump = 0
        let g:grepper.next_tool = '<leader>s'
    " }
    " php syntax coloring override {
        function! PhpSyntaxOverride()
          hi! def link phpDocTags  phpDefine
          hi! def link phpDocParam phpType
        endfunction

        augroup phpSyntaxOverride
          autocmd!
          autocmd FileType php call PhpSyntaxOverride()
        augroup END
    " }
    " Vim devicons {
        let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
        let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['phtml'] = ''
    " }
" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=40                " 40 lines of text instead of 24
    endif

" }

" Functions {
    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

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
    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }
    " TabPHPDoc {
    function TabPHPDoc()
        Tabularize/@\w\+\s\+\zs\S\+\|\%(@\w\+.*\)\@<=\u.*/
    endfunction
    " }
    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }
    " get the test file associated to the current file {
      function! s:GetAssociatedTestFile()
         return 'tests/'.expand("%:r").'Test.php'
      endfunction
    " }
    " Launch unit tests {
      function! s:RunTestFile(file)
        if filereadable(a:file)
            execute 'Dispatch phpunit --verbose -c tests/phpunit.xml --bootstrap tests/bootstrap.php '.a:file.'<cr>'
        else
            echo 'file '+a:file+' not readable'
        endif
      endfunction
      function! RunCurrentTestFile()
        if stridx(expand("%"), 'tests/') > -1
            call s:RunTestFile(expand("%"))
        else
            call s:RunTestFile(s:GetAssociatedTestFile())
        endif
      endfunction
      " }
" }

" Use local vimrc if available {
    if filereadable(expand("~/.config/nvim/local.vim"))
        source ~/.config/nvim/local.vim
    endif
" }

" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"}
call plug#begin()
" General {
    "Plug 'spf13/vim-colors'
    Plug 'tpope/vim-surround'
    Plug 'chriskempson/vim-tomorrow-theme'
    "Plug 'chriskempson/base16-vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'matchit.zip'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'flazz/vim-colorschemes'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-dispatch'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'wellle/targets.vim'
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-grepper'
" }
" General Programming {
    " Pick one of the checksyntax, jslint, or syntastic
    Plug 'benekastah/neomake'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'mattn/webapi-vim'
    Plug 'whatyouhide/vim-lengthmatters'
    "Plug 'mattn/gist-vim'
    Plug 'godlygeek/tabular'
    Plug 'airblade/vim-gitgutter'
    Plug 'jaxbot/github-issues.vim'
    "Plug 'tobyS/skeletons.vim'
    "Plug 'LionelMartin/vim-skeleton-files'
    "let g:skeletons_dir = $HOME"/.vim/bundles/vim-skeletons-files/skeletons/"
    Plug 'bkad/CamelCaseMotion'
    Plug 'joonty/vdebug', {'for': 'php'}
    Plug 'tpope/vim-dispatch'
    let g:dbgPavimPort = 9000
    if executable('ctags')
    Plug 'majutsushi/tagbar'
    endif
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-rfc'
    Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' } " optional syntax highlighting for RFC files
    Plug 'ryanoasis/vim-devicons'
" }
" Snippets & AutoComplete {
    "Plug 'Shougo/deoplete.nvim'
    Plug 'SirVer/ultisnips'
    "Plug 'Shougo/neosnippet'
    "Plug 'Shougo/neosnippet-snippets'
    "Plug 'LionelMartin/vim-snippets'
" }
" PHP {
    Plug 'tobyS/vmustache', {'for': 'php'}
    Plug 'tobyS/pdv', {'for': 'php'}
    "Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
    Plug 'StanAngeloff/php.vim', {'for': 'php'}
    Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}
    Plug 'LionelMartin/vim-php-manual', {'for': 'php'}
    "Plug 'docteurklein/php-getter-setter.vim', {'for': 'php'}
    Plug 'vim-php/vim-php-refactoring', {'for': 'php'}
    "Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
" }
" Python {
    " Pick either python-mode or pyflakes & pydoc
    Plug 'klen/python-mode', {'for': 'python'}
    Plug 'python.vim', {'for': 'python'}
    Plug 'python_match.vim', {'for': 'python'}
    Plug 'pythoncomplete', {'for': 'python'}
" }
" Javascript {
    Plug 'elzr/vim-json', {'for': 'javascript'}
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
    Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
    Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
    Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" }
" HTML {
    Plug 'amirh/HTML-AutoCloseTag', {'for': 'html'}
    Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
    Plug 'gorodinskiy/vim-coloresque', {'for': 'css'}
" }
" Misc {
    Plug 'tpope/vim-markdown', {'for': 'markdown'}
    Plug 'jtratner/vim-flavored-markdown', {'for': 'markdown'}
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" }
call plug#end()

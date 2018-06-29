" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"}
call plug#begin()
" General {
    Plug 'tpope/vim-surround'
    Plug 'chriskempson/vim-tomorrow-theme'
    Plug 'vim-scripts/matchit.zip'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-repeat'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'wellle/targets.vim'
    Plug 'mhinz/vim-startify'
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
    Plug 'vim-scripts/BufOnly.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'skywind3000/asyncrun.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-eunuch'
" }
" General Programming {
    Plug 'benekastah/neomake'
    Plug 'tpope/vim-fugitive'
    Plug 'mattn/webapi-vim'
    Plug 'whatyouhide/vim-lengthmatters'
    "Plug 'mattn/gist-vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'jaxbot/github-issues.vim'
    "Plug 'bkad/CamelCaseMotion'
    Plug 'joonty/vdebug'
    if executable('ctags')
    Plug 'majutsushi/tagbar'
    endif
    Plug 'tpope/vim-commentary'
    Plug 'ryanoasis/vim-devicons'
" }
" Snippets & AutoComplete {
    Plug 'SirVer/ultisnips'
" }
" PHP {
    Plug 'tobyS/vmustache', {'for': 'php'}
    Plug 'tobyS/pdv', {'for': 'php'}
    Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
    Plug 'StanAngeloff/php.vim', {'for': 'php'}
    Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}
    Plug 'LionelMartin/vim-php-manual', {'for': 'php'}
    "Plug 'vim-php/vim-php-refactoring', {'for': 'php'}
" }
" Javascript {
    Plug 'elzr/vim-json', {'for': 'javascript'}
    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    "Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
    Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
    Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
    Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" }
" HTML {
    Plug 'gorodinskiy/vim-coloresque', {'for': 'css'}
" }
" Misc {
    Plug 'tpope/vim-markdown', {'for': 'markdown'}
    Plug 'jtratner/vim-flavored-markdown', {'for': 'markdown'}
    Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" }
call plug#end()

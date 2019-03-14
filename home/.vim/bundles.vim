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
    Plug 'sunaku/vim-shortcut'
    Plug 'lambdalisue/suda.vim'
" }
" General Programming {
    Plug 'benekastah/neomake'
    Plug 'tpope/vim-fugitive'
    Plug 'whatyouhide/vim-lengthmatters'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-projectionist' "Per project settings
" }
" Snippets & AutoComplete {
    Plug 'SirVer/ultisnips'
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" }
" PHP {
    if executable('php')
        Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
        Plug 'StanAngeloff/php.vim', {'for': 'php'}
        Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}
        Plug 'LionelMartin/vim-php-manual', {'for': 'php'}
        Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev'}
        Plug 'joonty/vdebug', {'for': 'php'}
    endif
" }
" Go {
    if executable('go')
        Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
    endif
" }
" Python {
    if executable('python')
        Plug 'tmhedberg/SimpylFold', {'for': 'python'}
    endif
" }
" Javascript {
    if (exists('g:languages_javascript'))
        Plug 'elzr/vim-json', {'for': 'javascript'}
        Plug 'pangloss/vim-javascript', {'for': 'javascript'}
        Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
        Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
        Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
    endif
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
runtime plugin/shortcut.vim

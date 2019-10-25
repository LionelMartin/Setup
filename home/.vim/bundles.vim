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
    Plug 'junegunn/vim-peekaboo'
    "Plug 'zxqfl/tabnine-vim'
" }
" General Programming {
    Plug 'benekastah/neomake'
    Plug 'tpope/vim-fugitive'
    Plug 'whatyouhide/vim-lengthmatters'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'tpope/vim-projectionist' "Per project settings
    Plug 'elzr/vim-json', {'for': 'javascript'}
    Plug 'janko/vim-test'
" }
" Snippets & AutoComplete {
    Plug 'SirVer/ultisnips'
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" }
" PHP {
    if (exists('g:languages_php'))
        Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
        Plug 'StanAngeloff/php.vim', {'for': 'php'}
        Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}
        Plug 'LionelMartin/vim-php-manual', {'for': 'php'}
        Plug 'joonty/vdebug', {'for': 'php'}
    endif
" }
" Go {
    if (exists('g:languages_go'))
        Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries'}
    endif
" }
" Python {
    if (exists('g:languages_python'))
        Plug 'tmhedberg/SimpylFold', {'for': 'python'}
    endif
" }
" Javascript {
    if (exists('g:languages_javascript'))

        Plug 'pangloss/vim-javascript', {'for': 'javascript'}
        Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
        Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
        Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
    endif
" }
" HCL/Terraform {
    if (exists('g:languages_terraform'))
        Plug 'hashivim/vim-terraform'
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

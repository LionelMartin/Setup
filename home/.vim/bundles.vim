packadd minpac
if exists('g:loaded_minpac')
  " minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
" Themes {
"    call minpac#add('chriskempson/vim-tomorrow-theme')
"    call minpac#add('vim-airline/vim-airline-themes')
    call minpac#add('ghifarit53/tokyonight-vim')
" }
" General {
    call minpac#add('tpope/vim-surround')
    call minpac#add('vim-airline/vim-airline')
    "call minpac#add('tpope/vim-abolish')
    call minpac#add('tpope/vim-repeat')
    call minpac#add('AndrewRadev/splitjoin.vim')
    call minpac#add('wellle/targets.vim')
    call minpac#add('mhinz/vim-startify')
    call minpac#add('mhinz/vim-grepper')
    call minpac#add('vim-scripts/BufOnly.vim')
    call minpac#add('junegunn/fzf.vim')
	call minpac#add('skywind3000/asyncrun.vim')
    call minpac#add('editorconfig/editorconfig-vim') "Reads .editorconfig files
    call minpac#add('tpope/vim-eunuch') "Adds commands for file management :Rename :Move ...
    call minpac#add('lambdalisue/suda.vim')
    call minpac#add('junegunn/vim-peekaboo') " \" or @ displays the list of registers
	call minpac#add('danilamihailov/beacon.nvim') "Displays a cursor highlight when moving through the files
	call minpac#add('zegervdv/nrpattern.nvim') "Allows to increment/decrement numbers with formats, booleans...
    call minpac#add('liuchengxu/vim-which-key') "Menu for leader shortcuts
" }
" General Programming {
    call minpac#add('benekastah/neomake')
    call minpac#add('tpope/vim-fugitive') "Git integration
    call minpac#add('whatyouhide/vim-lengthmatters') "line length warning
    call minpac#add('airblade/vim-gitgutter')
    call minpac#add('tpope/vim-commentary') "Comment several lines
    call minpac#add('ryanoasis/vim-devicons')
    "call minpac#add('tpope/vim-projectionist') "Per project settings
    call minpac#add('elzr/vim-json')
    call minpac#add('janko/vim-test')
    call minpac#add('romainl/vim-devdocs')
    call minpac#add('wellle/context.vim') "Displays function names (wraps contents)
" }
" Snippets & AutoComplete {
    if has('nvim')
        call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
    else
        call minpac#add('Shougo/deoplete.nvim')
        call minpac#add('roxma/nvim-yarp')
        call minpac#add('roxma/vim-hug-neovim-rpc')
    endif
    call minpac#add('SirVer/ultisnips')
    " call minpac#add('neoclide/coc.nvim', {'do': { -> coc#util#install()}})
" }
" PHP {
    if (exists('g:languages_php'))
        call minpac#add('shawncplus/phpcomplete.vim')
        call minpac#add('StanAngeloff/php.vim')
        call minpac#add('rayburgemeestre/phpfolding.vim')
        call minpac#add('LionelMartin/vim-php-manual')
        call minpac#add('joonty/vdebug')
    endif
" }
" Go {
    if (exists('g:languages_go'))
        call minpac#add('fatih/vim-go', {'do': ':GoUpdateBinaries'})
        call minpac#add('tweekmonster/gofmt.vim')
        call minpac#add('jodosha/vim-godebug')
    endif
" }
" Python {
    if (exists('g:languages_python'))
        call minpac#add('tmhedberg/SimpylFold')
    endif
" }
" Javascript {
    if (exists('g:languages_javascript'))
        call minpac#add('pangloss/vim-javascript')
        call minpac#add('heavenshell/vim-jsdoc')
        call minpac#add('jelera/vim-javascript-syntax')
        call minpac#add('othree/javascript-libraries-syntax.vim')
    endif
" }
" HCL/Terraform {
    call minpac#add('hashivim/vim-terraform')
" }
" Google Protobuf {
    call minpac#add('uarun/vim-protobuf')
" }
" HTML {
    call minpac#add('gorodinskiy/vim-coloresque')
" }
" Misc {
    call minpac#add('jtratner/vim-flavored-markdown')
    call minpac#add('suan/vim-instant-markdown')
" }
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" from homebrew
set rtp+=/usr/local/opt/fzf
" from git
set rtp+=~/.fzf
let g:deoplete#enable_at_startup = 1

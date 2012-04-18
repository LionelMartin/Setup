let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /media/dev002/lm/bsbcm/trunk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +3 ~/.bash_local
badd +360 /media/dev002/lm/bsblogs/trunk/src/www/javascript/bs.js
badd +330 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/postsmedia/ui/PostsmediaDispatcher.class.php
badd +24 /media/dev002/lm/bsblogs/trunk/src/library/services/AbstractVideoService.class.php
badd +2 /media/dev002/lm/bsblogs/trunk/debian/install
badd +0 ~/.jslintrc
badd +23 ~/Documents/Setup/.vim/ftplugin/javascript/jslint.vim
badd +207 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/posts/ui/PostsDispatcher.class.php
badd +172 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/posts/PostsActions.class.php
badd +40 /media/dev002/lm/bsblogs/trunk/tests/library/bsblogs/modules/stats/backend/webalizer/Webalizer2012aTest.php
badd +65 /media/dev002/lm/bsblogs/trunk/tests/library/bsblogs/modules/stats/backend/webalizer/data/webalizer2012a.txt
badd +567 ~/communitiesactions.diff
badd +52 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/communities/CommunitiesChecker.class.php
badd +60 /media/dev002/lm/bsspams/trunk/src/conf.d/platform.php
badd +53 /media/dev002/lm/bsspams/trunk/src/library/bsspams/core/dispatchers/BsspamsDispatcher.class.php
badd +148 /media/dev002/lm/bsblogs/trunk/src/backend/templates/modules/postsmedia/video.htm
badd +148 /media/dev002/lm/bsblogs/trunk/src/backend/templates/modules/postsmedia/media.htm
badd +37 /media/dev002/lm/bsblogs/trunk/src/backend/templates/modules/postsmedia/file.htm
badd +24 /media/dev002/lm/bsblogs/trunk/src/library/services/google/googlemaps/GooglemapsGeocoding.class.php
badd +4 /media/dev002/lm/bsblogs/trunk/src/library/services/vimeo/vimeo.php
badd +268 /media/dev002/lm/bsblogs/trunk/src/autoload.php
badd +67 /media/dev002/lm/bsframework/trunk/src/bs/core/Loader.class.php
badd +340 /media/dev002/lm/bsframework/trunk/src/bs/core/dispatchers/BsDispatcher.class.php
badd +34 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/core/dispatchers/BsblogsDispatcher.class.php
badd +4 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/core/dispatchers/AbstractBsblogsDispatcher.class.php
badd +167 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/filemanager/FileManager.class.php
badd +78 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/filemanager/FilemanagerActions.class.php
badd +499 ~/Documents/Setup/.vim/plugin/php-doc.vim
badd +88 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/media/MediaActions.class.php
badd +70 /media/dev002/lm/bsblogs/trunk/src/library/services/google/youtube/YoutubeParser.class.php
badd +20 src/cli/index.php
badd +0 src/library/bcm/core/dispatchers/BcmDispatcher.class.php
badd +16 src/bcm/cliindex.php
badd +29 src/www/index.php
badd +77 src/library/bcm/modules/posts/ui/PostsDispatcher.class.php
badd +345 src/library/bcm/modules/posts/PostsActions.class.php
badd +52 src/library/bcm/modules/activitiesboard/ui/ActivitiesboardDispatcher.class.php
badd +329 src/library/bcm/modules/activitiesboard/ActivitiesboardActions.class.php
badd +217 src/library/bcm/modules/moderation/ModerationActions.class.php
badd +31 src/library/bcm/modules/solrcrawler/SolrcrawlerActions.class.php
badd +36 src/bcm/templates/modules/activitiesboard/publication_fragment.htm
badd +31 src/library/bcm/smarty/plugins/prefilter.bcm.php
badd +51 src/library/bcm/modules/dataflows/DataflowsActions.class.php
badd +55 src/library/bcm/modules/activitiesboard/ActivitiesboardAdditionalFilter.class.php
badd +191 src/library/bcm/modules/activitiesboard/ActivitiesboardFilter.class.php
badd +171 /media/dev002/lm/bsalice/trunk/src/library/bsalice/modules/bi/BiActions.class.php
badd +0 /media/dev002/lm/bsalice/trunk/src/www/bsmobile.php
badd +27 /media/dev002/lm/bsalice/trunk/src/www/index.php
badd +184 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/pages/ui/PagesDispatcher.class.php
badd +641 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/watchdog/WatchdogActions.class.php
badd +214 src/library/bcm/modules/postsmedia/PostsmediaActions.class.php
badd +79 src/library/bcm/modules/postsmedia/PostsmediaFilter.class.php
badd +0 /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/core/utils.php
badd +0 /media/dev002/lm/bzrvendors/hautetfort/trunk/classlib/smarty/plugins/prefilter.bannerhautetfort.php
args ~/.bash_local
edit /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/core/utils.php
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 774 - ((33 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
774
normal! 044l
tabedit /media/dev002/lm/bzrvendors/hautetfort/trunk/classlib/smarty/plugins/prefilter.bannerhautetfort.php
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 47 - ((36 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 090l
tabedit /media/dev002/lm/bsblogs/trunk/src/library/bsblogs/modules/media/MediaActions.class.php
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 544 - ((38 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
544
normal! 012l
tabnext 2
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

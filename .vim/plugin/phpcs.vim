function! RunPhpcs()
    let l:filename=@%
    let l:phpcs_output=system('phpcs --report=emacs --standard=blogSpirit '.l:filename)
    let l:phpcs_list=split(l:phpcs_output, "\n")
    unlet l:phpcs_list[0]
    cexpr l:phpcs_list
    cwindow
endfunction

function! RunPhpmd()
    let l:filename=@%
    let l:phpmd_output=system('phpmd '.l:filename.' text unusedcode,codesize,naming')
    let l:phpmd_list=split(l:phpmd_output, "\n")
    unlet l:phpmd_list[0]
    cexpr l:phpmd_list
    cwindow
endfunction

:autocmd FileType php set errorformat+=%f:%l:%c\ %m
:autocmd FileType php set errorformat+=%f:%l\t%m
command! Phpcs execute RunPhpcs()
command! Phpmd execute RunPhpmd()

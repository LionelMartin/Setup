nnoremap <leader>pd :call pdv#DocumentWithSnip()<cr>
" let g:DisableAutoPHPFolding = 0
let g:PIVAutoClose = 0
if exists("php_sql_query")
    unlet php_sql_query
endif
if exists("php_html_in_strings")
    unlet php_html_in_strings
endif
"let php_folding = 1
let g:pdv_cfg_php4always = 0 "do not display old @access doc string
let PHP_vintage_case_default_indent = 1 "cases in switch will be indented
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_add_class_extensions = ['mongo']
let g:phpcomplete_add_function_extensions = ['mongo']
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
let b:phpgetset_getterTemplate =
    \ "%public function %funcname%() {"
    \ "%    return $this->%varname%;"
    \ "}"
let b:phpgetset_setterTemplate =
    \ "public function %funcname%($%varname%) {"
    \ "%    $this->%varname% = $%varname%;"
    \ "}"
let no_php_maps = 1
nnoremap <buffer> <leader>pb <Plug>PhpgetsetInsertBothGetterSetter

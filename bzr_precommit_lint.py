#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# this is a plugin/hook for bazaar. just add this file to ~/.bazaar/plugins/precommit"""
# 
# @author:     starenka
# @email:      starenka0[at]gmail[dot]com
# @version:    1.1
# @since       Feb 28, 2010

import os
from bzrlib.branch import Branch

GREEN = '\033[32m'
RED = '\033[31m'
RESET = '\033[0;0m'
BOLD = '\033[1m'

def check_syntax(local, master, old_revno, old_revid, future_revno, future_revid, tree_delta, future_tree):
    import commands,py_compile
    from bzrlib import errors
    from bzrlib import urlutils
    BASE_PATH = urlutils.local_path_from_url(master.base)
    errors = False
    messages = []
    for i in tree_delta.added + tree_delta.modified:
        if i[0].find('.') == -1: 
            continue
        ext = i[0].split('.')[-1:][0]
        file = os.path.join(BASE_PATH,i[0])
        for ext in [ext]:
            if ext == 'py':
                try: 
                    py_compile.compile(file,'/tmp/x','/tmp%s'%file,True)
                except py_compile.PyCompileError,e: 
                    messages.append('[py]  %s'%e)
                break
            if ext == 'rb':
                (rc,mess) = commands.getstatusoutput("ruby -c %s | grep 'syntax error'"%file)
                if mess != '': 
                    messages.append('[rb]  %s'%mess)
                break
            if ext == 'php':
                (rc,mess) = commands.getstatusoutput("grep -e '^[=|<|>]{7}' %s"%file)
                if mess != '':
                    errors = True
                    messages.append("Conflict not resolved in %s"%file)
                (rc,mess) = commands.getstatusoutput("php -l %s | grep 'Parse error'"%file)
                if mess != '': 
                    messages.append('[php lint] %s'%mess)
                    errors = True
                (rc,mess) = commands.getstatusoutput("phpcs --report=emacs --standard=blogSpirit %s"%file)
                if mess != '':
                    if 'ERROR' in mess:
                        errors = True
                    messages.append('[phpcs] %s'%mess)
                (rc, mess) = commands.getstatusoutput("phpmd %s text ~/bs/phpmd.xml"%file)
                messages.append('[phpmd] %s'%mess)
                break
    if errors:
        print '\n%s%s%s%s'%(BOLD,RED,'\n'.join(messages),RESET)
        raise errors.BzrError("Commit aborted because pre-commit failed. You can do better :p")
    else:
        print '\n%s%s\nPhp code is ok :)%s'%(BOLD,GREEN,RESET)
        
Branch.hooks.install_named_hook('pre_commit', check_syntax,'Pre-commit')

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
from bzrlib import errors

GREEN = '\033[32m'
RED = '\033[31m'
RESET = '\033[0;0m'
BOLD = '\033[1m'

def check_syntax(local, master, old_revno, old_revid, future_revno, future_revid, tree_delta, future_tree):
    import commands,py_compile
    from bzrlib import urlutils
    if local:
        BASE_PATH = urlutils.local_path_from_url(local.base)
    else:
        path = os.getcwd()
        idx = path.find('trunk')
        #not commiting on trunk => probably shouldn't run tests
        if idx < 1: 
            print 'Current branch is not trunk, bypassing precommit'
            return True
        BASE_PATH = path[0:idx + 6]
    
    errorsFound = False
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
                    errorsFound = True
                    messages.append("/!\\ Conflict not resolved in %s /!\\"%file)
                (rc,mess) = commands.getstatusoutput("php -l %s | grep 'Parse error'"%file)
                if mess != '': 
                    messages.append('[php lint] -----------\n%s\n----------------'%mess)
                    errorsFound = True
                (rc,mess) = commands.getstatusoutput("phpcs --report=emacs --standard=blogSpirit %s"%file)
                if mess != '':
                    if 'error' in mess:
                        errorsFound = True
                    messages.append('[phpcs] --------------\n%s\n----------------'%mess)
                (rc, mess) = commands.getstatusoutput("phpmd %s text ~/bs/phpmd.xml"%file)
                if mess != '':
                    messages.append('[phpmd] --------------\n%s\n----------------'%mess)
                break
    messages = '\n'.join(messages)
    if errorsFound:
        gui = os.system("ps aux |grep %s |grep -v grep| grep 'bzr qsubprocess --bencode'"%os.getpid())
        msg_info = "Pre commit checks failed\n%s"%messages
        msg_continue = "Are you really sure you want to commit anyway ? (y/n)"
        msg_error = "Pre commit checks failed."
        if gui == 0:
            gui_dialog(msg_info, msg_continue, msg_error)
        else:
            cmdline_input(msg_info, msg_continue, msg_error)

    else:
        print messages
        print 'Code is good enough :)'
        
Branch.hooks.install_named_hook('pre_commit', check_syntax,'Pre-commit')
## Create a dialog Window bleh
def gui_dialog(msg_info, msg_continue, msg_error):
       import gtk
       label = gtk.Label(msg_info)
       dialog = gtk.Dialog(msg_continue, None, 0, (gtk.STOCK_YES, gtk.RESPONSE_YES, gtk.STOCK_NO, gtk.RESPONSE_NO))
       dialog.vbox.pack_start(label)
       label.show()
       response = dialog.run()
       dialog.destroy()
       while gtk.events_pending():
           gtk.main_iteration(False)
           if response == gtk.RESPONSE_YES:
               break
           elif response == gtk.RESPONSE_NO:
               raise errors.BzrError(msg_error)

## Cmd line input
def cmdline_input(msg_info, msg_continue, msg_error):
    print msg_info
    var = raw_input(msg_continue)
    if var.lower() != "y":
        raise errors.BzrError(msg_error)


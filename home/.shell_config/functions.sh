sourcePath () {
    local PATHVARIABLE = "$HOME/$1"
    if [ -d $PATHVARIABLE ] ; then
        for script in $PATHVARIABLE/*.sh ; do
            if [ -r $script ] ; then
                source $script
            fi
        done
    fi
}

appendToPath () {
    if [ -d $1 ] ; then
        PATH="$PATH:$1"
    fi
}

prependToPath () {
    if [ -d $1 ] ; then
        PATH="$1:$PATH"
    fi
}

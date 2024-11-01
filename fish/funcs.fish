function ncd
    # Block nesting of nnn in subshells (Fish version)
    if set -q NNNLVL; and test $NNNLVL -ge 1
        echo "nnn is already running"
        return
    end

    nnn $argv
    if test -f "$NNN_TMPFILE"
        source "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    end

    commandline -f repaint
end

function vif
    set file (fd -t f | fzf)
    if test -n "$file"
        $EDITOR $file
    end

    commandline -f repaint
end

function cdf --argument depth
    set depth 1

    if test "$depth" = "1"
        set dir (fd -I -t d | fzf)
    else if test "$depth" = "-1"
        set dir (fd -I -t d | fzf)
    else
        set dir (fd -I -t d --max-depth $depth | fzf)
    end

    if test -n "$dir"
        cd $dir
    end

    commandline -f repaint
end

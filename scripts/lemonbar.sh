#!/bin/sh

workspace_active_bg="#569CD6"
workspace_active_fg="#000000"

fifo=/tmp/lemonbar.fifo
test -e $fifo && rm $fifo
mkfifo $fifo

trap 'pkill lemonbar; kill $(jobs -p); rm -rf $fifo;' EXIT

bspc_desktops() {
    buf=""
    desktops=$(bspc query -D --names)
    for d in ${desktops[@]}; do
        if [[ "$(bspc query -D -d focused --names)" == "${d}" ]]; then
            buf="${buf}%{B${workspace_active_bg}} %{F${workspace_active_fg}}${d}%{F-} %{B-}"
        else
            buf="${buf} ${d} "
        fi
    done

    echo "${buf}"
}

while :; do
    date "+DAT%H:%M" > $fifo
    sleep 1;
done &

while read -r line; do
    echo "DES$(bspc_desktops)" > $fifo
done < <(bspc subscribe desktop) &

desktop="$(bspc_desktops)"
while read -r line; do
    if [[ -z $(pgrep bspwm) ]]; then
        exit 0;
    fi

    case $line in
        DAT*)
            date="${line#???}"
            ;;
        DES*)
            desktop="${line#???}"
            ;;
        *)
            ;;
    esac

    echo "%{l}${desktop} %{r}${date} "
done < <(tail -f $fifo)

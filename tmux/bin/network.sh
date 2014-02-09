#!/bin/bash
# By default, we won't bug the user with the display of network traffic
# below NETWORK_THRESHOLD in kbps; override in $BYOBU_CONFIG_DIR/status
get_network_interface() {
    if [ -n "$MONITORED_NETWORK" ]; then
        _RET="$MONITORED_NETWORK"
    else
        local Iface Destination Gateway Flags RefCnt Use Metric Mask MTU Window IRTT
        while read Iface Destination Gateway Flags RefCnt Use Metric Mask MTU Window IRTT; do
            [ "$Mask" = "00000000" ] && break
        done < /proc/net/route
        _RET="$Iface"
    fi
}

network() {
    get_network_interface; local interface="$_RET"
    local x1=0 x2=0
    t=1 # needs to be set to the status refresh interval?
    for i in up down; do
        unit="kbps"
        while read iface rbytes rpackets rerrs rdrop rfifo rframe rcompressed rmulticast tbytes tpackets terrs tdrop tfifo tcolls tcarrier tcompressed; do
            if [ "$iface" = "${interface}" ]; then
                [ "$i" = "up" ] && x2=${tbytes} || x2=${rbytes}
                break;
            fi
        done < /proc/net/dev
        rate=$((8*($x2 - $x1) / $t / 1024)) # in kbps
        [ "$rate" -lt 0 ] && rate=0
        echo $rate
    done
}
network

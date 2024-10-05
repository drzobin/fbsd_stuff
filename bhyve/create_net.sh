sysctl net.link.tap.up_on_open=1
sysctl net.inet.ip.forwarding=1

ifconfig tap0 create
ifconfig tap1 create
ifconfig bridge0 create
ifconfig bridge0 addm ue0 addm tap0 addm tap1
ifconfig bridge0 up

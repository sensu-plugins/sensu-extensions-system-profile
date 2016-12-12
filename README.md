# Sensu System Profile Extension

This check extension collects Linux system metrics. This extension
reads and parses `/proc/stat`, `/proc/loadavg`, `/proc/net/dev`, and
`/proc/meminfo` to produce the system metrics in the Graphite
plaintext format.

## Installation

On a Sensu client machine.

For Sensu version < 0.27:

```
/opt/sensu/embedded/bin/gem install sensu-extensions-system-profile -v 1.0.0
```

For Sensu version >= 0.27:

```
sensu-install -e system-profile:1.0.0
```

Edit `/etc/sensu/conf.d/extensions.json` to load it.

``` json
{
  "extensions": {
    "system-profile": {
      "version": "1.0.0"
    }
  }
}
```

Restart the Sensu client.

``` shell
sudo service sensu-client restart
```

## Configuration

Edit `/etc/sensu/conf.d/system_profile.json` to change its configuration.

``` json
{
  "system_profile": {
    "interval": 30
  }
}
```

|attribute|type|default|description|
|----|----|----|----|
|interval|integer|10|How often metrics will be collected and sent to Sensu|
|add_client_prefix|boolean|true|If the Sensu client name should prefix the Graphite metric path|
|path_prefix|string|"system"|The Graphite metric path prefix|
|prefix_at_start|boolean|true|If the path_prefix should be before the Sensu client name|
|handler|string|"graphite"|Handler to use for the Graphite metrics|

## Example

Example metrics produced by this extension:

```
com.sensuapp.demo.cpu.user 5.94 1481579445
com.sensuapp.demo.cpu.nice 0.00 1481579445
com.sensuapp.demo.cpu.system 0.00 1481579445
com.sensuapp.demo.cpu.idle 93.56 1481579445
com.sensuapp.demo.cpu.iowait 0.00 1481579445
com.sensuapp.demo.cpu.irq 0.00 1481579445
com.sensuapp.demo.cpu.softirq 0.00 1481579445
com.sensuapp.demo.cpu.steal 0.00 1481579445
com.sensuapp.demo.cpu.guest 0.00 1481579445
com.sensuapp.demo.cpu0.user 7.00 1481579445
com.sensuapp.demo.cpu0.nice 0.00 1481579445
com.sensuapp.demo.cpu0.system 0.00 1481579445
com.sensuapp.demo.cpu0.idle 92.00 1481579445
com.sensuapp.demo.cpu0.iowait 0.00 1481579445
com.sensuapp.demo.cpu0.irq 0.00 1481579445
com.sensuapp.demo.cpu0.softirq 0.00 1481579445
com.sensuapp.demo.cpu0.steal 0.00 1481579445
com.sensuapp.demo.cpu0.guest 0.00 1481579445
com.sensuapp.demo.cpu1.user 4.90 1481579445
com.sensuapp.demo.cpu1.nice 0.00 1481579445
com.sensuapp.demo.cpu1.system 0.00 1481579445
com.sensuapp.demo.cpu1.idle 94.12 1481579445
com.sensuapp.demo.cpu1.iowait 0.00 1481579445
com.sensuapp.demo.cpu1.irq 0.00 1481579445
com.sensuapp.demo.cpu1.softirq 0.00 1481579445
com.sensuapp.demo.cpu1.steal 0.00 1481579445
com.sensuapp.demo.cpu1.guest 0.00 1481579445
com.sensuapp.demo.intr 0 1481579445
com.sensuapp.demo.ctxt 5686042 1481579445
com.sensuapp.demo.btime 1481571436 1481579445
com.sensuapp.demo.processes 17596 1481579445
com.sensuapp.demo.procs_running 1 1481579445
com.sensuapp.demo.procs_blocked 0 1481579445
com.sensuapp.demo.load_avg.1_min 0.0 1481579445
com.sensuapp.demo.load_avg.5_min 0.02 1481579445
com.sensuapp.demo.load_avg.15_min 0.01 1481579445
com.sensuapp.demo.net.lo.rxbytes 327498164 1481579445
com.sensuapp.demo.net.lo.rxpackets 547609 1481579445
com.sensuapp.demo.net.lo.rxerrors 0 1481579445
com.sensuapp.demo.net.lo.rxdrops 0 1481579445
com.sensuapp.demo.net.lo.rxfifo 0 1481579445
com.sensuapp.demo.net.lo.rxframe 0 1481579445
com.sensuapp.demo.net.lo.rxcompressed 0 1481579445
com.sensuapp.demo.net.lo.rxmulticast 0 1481579445
com.sensuapp.demo.net.lo.txbytes 327498164 1481579445
com.sensuapp.demo.net.lo.txpackets 547609 1481579445
com.sensuapp.demo.net.lo.txerrors 0 1481579445
com.sensuapp.demo.net.lo.txdrops 0 1481579445
com.sensuapp.demo.net.lo.txfifo 0 1481579445
com.sensuapp.demo.net.lo.txcolls 0 1481579445
com.sensuapp.demo.net.lo.txcarrier 0 1481579445
com.sensuapp.demo.net.lo.txcompressed 0 1481579445
com.sensuapp.demo.net.eth1.rxbytes 0 1481579445
com.sensuapp.demo.net.eth1.rxpackets 0 1481579445
com.sensuapp.demo.net.eth1.rxerrors 0 1481579445
com.sensuapp.demo.net.eth1.rxdrops 0 1481579445
com.sensuapp.demo.net.eth1.rxfifo 0 1481579445
com.sensuapp.demo.net.eth1.rxframe 0 1481579445
com.sensuapp.demo.net.eth1.rxcompressed 0 1481579445
com.sensuapp.demo.net.eth1.rxmulticast 0 1481579445
com.sensuapp.demo.net.eth1.txbytes 0 1481579445
com.sensuapp.demo.net.eth1.txpackets 0 1481579445
com.sensuapp.demo.net.eth1.txerrors 0 1481579445
com.sensuapp.demo.net.eth1.txdrops 0 1481579445
com.sensuapp.demo.net.eth1.txfifo 0 1481579445
com.sensuapp.demo.net.eth1.txcolls 0 1481579445
com.sensuapp.demo.net.eth1.txcarrier 0 1481579445
com.sensuapp.demo.net.eth1.txcompressed 0 1481579445
com.sensuapp.demo.net.eth0.rxbytes 33463043 1481579445
com.sensuapp.demo.net.eth0.rxpackets 52350 1481579445
com.sensuapp.demo.net.eth0.rxerrors 0 1481579445
com.sensuapp.demo.net.eth0.rxdrops 0 1481579445
com.sensuapp.demo.net.eth0.rxfifo 0 1481579445
com.sensuapp.demo.net.eth0.rxframe 0 1481579445
com.sensuapp.demo.net.eth0.rxcompressed 0 1481579445
com.sensuapp.demo.net.eth0.rxmulticast 0 1481579445
com.sensuapp.demo.net.eth0.txbytes 28041733 1481579445
com.sensuapp.demo.net.eth0.txpackets 33640 1481579445
com.sensuapp.demo.net.eth0.txerrors 0 1481579445
com.sensuapp.demo.net.eth0.txdrops 0 1481579445
com.sensuapp.demo.net.eth0.txfifo 0 1481579445
com.sensuapp.demo.net.eth0.txcolls 0 1481579445
com.sensuapp.demo.net.eth0.txcarrier 0 1481579445
com.sensuapp.demo.net.eth0.txcompressed 0 1481579445
com.sensuapp.demo.memory.total 4046708 1481579445
com.sensuapp.demo.memory.free 2263576 1481579445
com.sensuapp.demo.memory.available 2555280 1481579445
com.sensuapp.demo.memory.buffers 35740 1481579445
com.sensuapp.demo.memory.cached 447828 1481579445
com.sensuapp.demo.swap.cached 0 1481579445
com.sensuapp.demo.memory.active 1519056 1481579445
com.sensuapp.demo.swap.total 0 1481579445
com.sensuapp.demo.swap.free 0 1481579445
com.sensuapp.demo.memory.committed_as 2890836 1481579445
```

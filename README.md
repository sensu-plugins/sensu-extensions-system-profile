# Sensu::Extensions::SystemProfile

This check extension collects Linux system metrics. This extension
reads and parses `/proc/stat`, `/proc/loadavg`, `/proc/net/dev`, and
`/proc/meminfo` to produce the system metrics.

## Configuration

`/etc/sensu/conf.d/system_profile.json`:

``` json
{
  "system_profile": {
    "interval": 10,
    "handler": "graphite",
    "add_client_prefix": true,
    "path_prefix": "system",
    "prefix_at_start": true
  }
}
```

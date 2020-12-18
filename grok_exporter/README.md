### Source

Docker image project for `https://github.com/fstab/grok_exporter`.

### Container dependencies:

1. Your app main log folder, with `log_file_folder_path`, mount to `/log`
2. config.yml for grok exporter, with `grok_exporter_config_path.yml`, mount to `/grok/config.yml`

### Example for grok_exporter_config_path.yml

```yaml
global:
  config_version: 3
input:
  type: file
  path: /log/default.log          # Log file
  readall: true
imports:
  - type: grok_patterns
    dir: /grok/default/patterns   # Path in the container
metrics:
  - type: counter
    name: grok_example_lines_total
    help: Counter metric example with labels.
    match: '%{DATE} %{TIME} %{USER:user} %{NUMBER}'
    labels:
      user: '{{.user}}'
      logfile: '{{base .logfile}}'
server:
  port: 9144
```

### Example for docker run

```shell
docker run -d \
       --name grok_exporter \
       -p 9144:9144 \
       -v log_file_folder_path:/log \
       -v grok_exporter_config_path.yml:/grok/config.yml \
       cvvnx1/grok_exporter
```

### Example for docker-compose.yml

```yaml
version: '3.8'

services:
  mtail:
    image: cvvnx1/grok_exporter
    container_name: grok_exporter
    ports:
      - 9144:9144
    volumes:
      - main_log_path.log:/log/default.log
      - grok_exporter_config_path.yml:/grok/config.yml
    restart: unless-stopped
```

### Valid

```shell
curl http://localhost:9144/metrics
```

### References

- https://github.com/fstab/grok_exporter/blob/master/CONFIG.md

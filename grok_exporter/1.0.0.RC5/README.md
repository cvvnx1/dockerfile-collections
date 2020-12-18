Example for docker-compose.yml

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
      - grok_exporter_config.yml:/grok/config.yml
    restart: unless-stopped
```

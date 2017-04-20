Docker image for [dudel](https://github.com/opatut/dudel)

Download [config.py](https://raw.githubusercontent.com/opatut/dudel/master/config.py.example) and adjust the settings.

```bash
docker run -v "$(readlink -f config.py)" -p 80:8888 --restart unless-stopped rankenstein/dudel
```

```yaml
version: '2'
services:
    dudel:
        image: rankenstein/dudel
        volumes:
            - ./config.py:/dudel/config.py
        ports:
            - 80:8888
        restart: unless-stopped
```

You might want to run a postgres database image and configure the connection in config.py.

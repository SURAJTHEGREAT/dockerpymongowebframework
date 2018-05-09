#SHA := $(shell git describe --match=NeVeRmAtCh --always --abbrev=40 --dirty=*)

env:
	bin/write-env.sh conf

exec:
	docker-compose exec $(container)  /bin/bash

down:
	bin/down.sh $(volume)

up:
	docker-compose up -d

logs:
	docker logs -f $(name)

help:
	tail bin/commands.txt

        

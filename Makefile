#SHA := $(shell git describe --match=NeVeRmAtCh --always --abbrev=40 --dirty=*)

env:
	bin/write-env.sh conf

exec:
	docker-compose exec $(container)  /bin/bash

down:
	bin/down.sh $(volume)

up:
	docker-compose up -d

show:
	docker-compose ps

logs:
	docker logs -f $(name)

help:
	cat bin/commands.txt

        

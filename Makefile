all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""   1. make server       - run server

server: port serverplay

serverplay:
	ansible-playbook `cat NAME`.yml

prep: bootstrap docker

docker:
	ansible-playbook docker.yml

bootstrap:
	ansible-playbook bootstrapAnsible.yml

port:
	@while [ -z "$$port" ]; do \
		read -r -p "Enter the port of the Docker server you wish to associate with this agent : " port; echo "$$port">>port; cat port; \
	done ;

NAME:
	@while [ -z "$$NAME" ]; do \
		read -r -p "Enter the name you wish to associate with this container [NAME]: " NAME; echo "$$NAME">>NAME; cat NAME; \
	done ;

TAG:
	@while [ -z "$$TAG" ]; do \
		read -r -p "Enter the name you wish to associate with this container [TAG]: " TAG; echo "$$TAG">>TAG; cat TAG; \
	done ;

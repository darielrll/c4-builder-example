
plantuml-server-up:
	docker run -d -p 8091:8080 \
			--name plantuml \
			-e ALLOW_PLANTUML_INCLUDE=true \
			-v $(PWD)/resources/lib/:/usr/local/tomcat/webapps/static \
			hub.docker.prod.walmart.com/plantuml/plantuml-server:tomcat

plantuml-server-down:
	docker rm -f plantuml

run:
	echo "Remove old site"
	rm -rfv docs/
	echo "Create new site"
	c4builder site

getting-started:
	npm i -g c4builder

get-inside-server:
	docker exec -it plantuml sh
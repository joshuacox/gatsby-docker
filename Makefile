build:
	docker build -t joshuacox/gatsby-docker .


develop:
	docker run \
		-it \
		--rm \
		-v $(pwd)/site:/site \
		-v $(HOME)/.gitconfig:/root/.gitconfig \
	       	-p 8000:8000 \
		joshuacox/gatsby-docker \
		develop

serve:
	docker run \
		-it \
		--rm \
		-v $(pwd)/site:/site \
		-v $(HOME)/.gitconfig:/root/.gitconfig \
	       	-p 8000:8000 \
		joshuacox/gatsby-docker \
		serve	

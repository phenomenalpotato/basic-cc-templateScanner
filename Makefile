LIBS = -lcurl

delete:
	@echo "Deleting Template_Scanner executable"
	rm -f Template_Scanner_C/Template_Scanner 

build-dockerfile:
	@echo "Building DockerFile"
	docker build --tag templatescanner:latest .

docker-run:
	@docker run templatescanner:latest /bin/bash -c "echo Authorization: ApiKey your_api_key_here > api.txt;/var/set-env.sh"
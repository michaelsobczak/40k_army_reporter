startdocker:
	docker-machine start || echo "docker machine already running..."

login:
	docker login

build:
	echo "Building docker image..."
	docker build -t servitorapp/armybuilder:latest \
		--build-arg RDS_HOSTNAME=${RDS_HOSTNAME} --build-arg RDS_PORT=${RDS_PORT} \
		--build-arg RDS_DB_NAME=${RDS_DB_NAME} --build-arg RDS_USERNAME=${RDS_USERNAME} \
		--build-arg RDS_PASSWORD=${RDS_PASSWORD} .

run: build startdocker
	echo "Running docker image..."
	docker run -p 6969:5000 servitorapp/armybuilder:latest

# kill: .PHONY
# 	IMAGE="$(shell docker ps --filter 'ancestor=servitorapp/armybuilder:latest' --format '{{ .Names }}')"
# 	docker kill $$IMAGE

push: build login
	echo "Pushing docker image to dockerhub..."
	docker push servitorapp/armybuilder:latest
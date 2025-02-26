.PHONY: update-front-end
update-front-end:
	@sudo docker build --no-cache ./front_end -t ghcr.io/asteurer/tsteurer.com-front-end \
		&& sudo docker login ghcr.io \
		&& sudo docker push ghcr.io/asteurer/tsteurer.com-front-end
up:
	sudo docker build ./front_end -t ghcr.io/asteurer/tsteurer.com-front-end && sudo docker run -dp 8080:8080 ghcr.io/asteurer/tsteurer.com-front-end
down:
	sudo docker stop $$(sudo docker ps | awk '/tsteurer/ {print $$1}')
copy:
	@sudo rm -rf website
	@sudo docker cp $$(sudo docker ps | awk '/tsteurer/ {print $$1}'):/app/build/. ./website
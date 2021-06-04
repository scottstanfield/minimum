.DEFAULT_GOAL := run

build:
	docker build -t minimum .

run: build
	docker run --rm -it minimum

clean:
	docker rmi minimum

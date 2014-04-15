TAG=0.10
REPO=fudanchii

all:
	docker build -t ${REPO}/base:${TAG} --rm ./
	docker tag ${REPO}/base:${TAG} ${REPO}/base:latest

go:
	docker build -t ${REPO}/go:${TAG} --rm go_image

python:
	docker build -t ${REPO}/python:${TAG} --rm python_image

rails:
	docker build -t ${REPO}/rails:${TAG} --rm rails_image

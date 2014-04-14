TAG=0.9
REPO=fudanchii

all:
	docker build -t ${REPO}/base:${TAG} -rm ./
	docker tag ${REPO}/base:${TAG} ${REPO}/base:latest

python:
	docker build -t ${REPO}/python:${TAG} -rm python_image

rails:
	docker build -t ${REPO}/rails:${TAG} -rm rails_image

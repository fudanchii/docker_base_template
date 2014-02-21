TAG=0.9
REPO=fudanchii/base

all:
	docker build -t ${REPO}:${TAG} -rm ./

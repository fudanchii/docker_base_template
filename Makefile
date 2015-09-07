TAG=0.13
REPO=veritrans

all:
	docker build -t ${REPO}/base:${TAG} --rm ./
	docker tag ${REPO}/base:${TAG} ${REPO}/base:latest

go:
	docker build -t ${REPO}/go:${TAG} --rm go_image

python:
	docker build -t ${REPO}/python:${TAG} --rm python_image

rails:
	docker build -t ${REPO}/rails:${TAG} --rm rails_image

turbo:
	docker build -t ${REPO}/turbo:${TAG} --rm rails_image

java:
	docker build -t ${REPO}/java8:${TAG} --rm java8_image

java7:
	docker build -t ${REPO}/java7:${TAG} --rm java_image

centos:
	docker build -t ${REPO}-centos/base:${TAG} --rm centos

postgres:
	docker build -t ${REPO}/postgres:9.3 --rm postgresql

.PHONY: centos

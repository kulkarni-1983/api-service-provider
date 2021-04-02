export APP_VERSION ?= $(shell jq -r '.version' package.json) 
export GIT_COMMIT ?= $(shell git rev-parse --short HEAD)
export SERVER_PORT ?= 8080
export LOG_LEVEL ?= info

docker_run_builder=docker-compose run --rm builder
export IMAGE_NAME=api-service-provider

# Uses the atrifact url if provided else assumes ECR using the provided AWS account details
export AWS_REGION ?= $(AWS_DEFAULT_REGION)
export ARTIFACT_URL ?= $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com



.PHONY: build
build:
	@echo "build and test of the package"
	$(docker_run_builder) yarn build

.PHONY: lint_fix
lint_fix:
	@echo "fix the linting issues"
	$(docker_run_builder) yarn fix

.PHONY: run_image
run_image:
	docker-compose up --force-recreate $(IMAGE_NAME)

.PHONY: build_image
build_image:
	@echo "building $(IMAGE_NAME) image"
	docker-compose build $(IMAGE_NAME)

.PHONY: tag_image
tag_image:
	@echo "tagging the image $(IMAGE_NAME):$(APP_VERSION)"
	docker tag $(IMAGE_NAME) $(ARTIFACT_URL)/$(IMAGE_NAME):$(APP_VERSION)
	@echo "tagging latest $(IMAGE_NAME):latest"
	docker tag $(IMAGE_NAME) $(ARTIFACT_URL)/$(IMAGE_NAME):latest

.PHONY: ecr_login
ecr_login:
	aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ARTIFACT_URL)

.PHONY: ecr_create_repository
ecr_create_repository:
	aws ecr create-repository \
    --repository-name $(IMAGE_NAME) \
    --image-scanning-configuration scanOnPush=true \
    --region $(AWS_REGION)


.PHONY: push_image
push_image:
	@echo "push the image $(IMAGE_NAME):$(APP_VERSION)"
	docker push $(ARTIFACT_URL)/$(IMAGE_NAME):$(APP_VERSION)
	docker push $(ARTIFACT_URL)/$(IMAGE_NAME):latest
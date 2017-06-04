TF_DIR := ./terraform

clean:
	pushd ${TF_DIR}; \
	rm -rf *out *tfstate*; \
	popd ${TF_DIR}

up:
	docker-compose up -d

down:
	docker-compose down

init:
	pushd ${TF_DIR}; \
	terraform init; \
	popd ${TF_DIR}

plan:
	pushd ${TF_DIR}; \
	rm a.out; \
	terraform plan -out a.out; \
	popd ${TF_DIR}

apply:
	pushd ${TF_DIR}; \
	terraform apply a.out; \
	popd ${TF_DIR}



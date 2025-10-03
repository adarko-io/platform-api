.PHONY: requirements platform-api

GRPC_GW_PATH := $(shell go list -f '{{ .Dir }}' github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway)
GOOGLEAPIS_PATH := "$(GRPC_GW_PATH)/../third_party/googleapis"

all: requirements platform-api

requirements:
	@go mod download
	@go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	@go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway

platform-api:
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --swagger_out=json_names_for_fields=true:. platform/service/inventory.proto
	
	
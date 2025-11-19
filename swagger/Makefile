.PHONY: requirements platform-api

GRPC_GW_PATH := $(shell go list -f '{{ .Dir }}' github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway)
GOOGLEAPIS_PATH := "$(GRPC_GW_PATH)/../third_party/googleapis"

all: requirements platform-api

requirements:
	@go mod download
	@go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
	@go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway

platform-api:
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/inventory.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/consumer.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --swagger_out=json_names_for_fields=true:. platform/connection.proto
	
	
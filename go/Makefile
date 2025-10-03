.PHONY: requirements platform-api

GRPC_GW_PATH := $(shell go list -f '{{ .Dir }}' github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway)
GOOGLEAPIS_PATH := "$(GRPC_GW_PATH)/../third_party/googleapis"

all: requirements platform-api

requirements:
	@go mod download
	@go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	@go install github.com/golang/protobuf/protoc-gen-go


platform-api:
	# gRPC
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_shared_enums.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/platform_inventory.proto

	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_shared_enums.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/platform_inventory.proto
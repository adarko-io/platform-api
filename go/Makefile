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
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/shared_enums.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --go_out=plugins=grpc,paths=source_relative:. platform/service/inventory.proto
	
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/shared_enums.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/service/inventory.proto
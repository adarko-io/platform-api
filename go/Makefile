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
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/shared_enums.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/inventory.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/consumer.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/connection.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/deviceprofile.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --go_out=plugins=grpc,paths=source_relative:. platform/billing.proto
	
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/shared_enums.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/helper.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/inventory.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/consumer.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/connection.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/deviceprofile.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/platform --grpc-gateway_out=paths=source_relative,logtostderr=true:. platform/billing.proto
.PHONY: requirements external-api

GRPC_GW_PATH := $(shell go list -f '{{ .Dir }}' github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway)
GOOGLEAPIS_PATH := "$(GRPC_GW_PATH)/../third_party/googleapis"

all: requirements external-api

requirements:
	@go mod download
	@go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	@go install github.com/golang/protobuf/protoc-gen-go


external-api:
	# gRPC
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --go_out=plugins=grpc,paths=source_relative:. external/service/lorawan_types.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service -I=../protobuf --go_out=plugins=grpc,paths=source_relative:. external/service/inventory.proto
	
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/internal.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/user.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/tenant.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/application.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/device.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/data.proto
	protoc -I=$(GOOGLEAPIS_PATH) -I=../protobuf -I=../protobuf/external/service -I=../protobuf --grpc-gateway_out=paths=source_relative,logtostderr=true:. external/service/inventory.proto

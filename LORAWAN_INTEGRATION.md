# LoRaWAN Integration Guide

This document explains how to integrate your existing LoRaWAN API (`console-lorawan-api`) with the platform-api inventory service.

## Problem Solved: Naming Conflicts

**Issue**: Both projects have `device.proto` in the same path:
- platform-api: `protobuf/external/service/device.proto` (package `api`)
- console-lorawan-api: `protobuf/external/service/device.proto` (package `service`)

**Solution**: Namespaced imports using symbolic links and explicit paths.

## Current Integration Structure

```
platform-api/
├── protobuf/
│   ├── external/service/
│   │   ├── device.proto          # Your platform device service
│   │   ├── inventory.proto       # Inventory service (imports LoRaWAN)
│   │   └── ...
│   └── lorawan/                  # Namespace for LoRaWAN imports
│       ├── external/             # → symlink to vendor/console-lorawan-api/protobuf/external/
│       └── util/                 # → symlink to vendor/console-lorawan-api/protobuf/util/
└── vendor/
    └── console-lorawan-api/      # Git submodule
```

## Import Resolution

### In inventory.proto:
```protobuf
// This imports from YOUR platform-api device service
import "external/service/device.proto";     // → platform-api device.proto

// This imports from LoRaWAN API via namespace
import "lorawan/external/service/device.proto";  // → console-lorawan-api device.proto
import "lorawan/util/util.proto";                // → console-lorawan-api util.proto
```

### Type Usage:
```protobuf
message DeviceConfiguration {
  oneof config {
    // Uses the LoRaWAN Device type from console-lorawan-api
    service.Device lorawan_device = 1;
    
    // Other device types for your platform
    CellularMQTTConfig cellular_mqtt = 2;
    // ...
  }
}
```

## Build Configuration

The Makefiles are updated to include the correct include paths:
- `-I=../protobuf` for your platform protos
- `-I=../protobuf/external/service` for your services
- The lorawan namespace is resolved via symbolic links

## Integration Workflow

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Inventory      │    │   Platform      │    │  LoRaWAN NS     │
│  Service        │    │   Device        │    │ (console-api)   │
│                 │    │   Service       │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │ 1. LoRaWAN device     │                       │
         │    in inventory       │                       │
         │    (with service.     │                       │
         │     Device config)    │                       │
         │                       │                       │
         │ 2. Device provisioning│                       │
         │ ─────────────────────→│                       │
         │                       │                       │
         │                       │ 3. Extract LoRaWAN    │
         │                       │    config & create    │
         │                       │    in LoRaWAN NS      │
         │                       │ ─────────────────────→│
         │                       │                       │
         │ 4. Update status      │                       │
         │ ←─────────────────────│                       │
```

## Key Benefits

1. ✅ **No Naming Conflicts**: Each device.proto is properly namespaced
2. ✅ **Full Type Reuse**: Direct use of LoRaWAN Device types without duplication
3. ✅ **Clean Separation**: Platform device service vs LoRaWAN device service
4. ✅ **Maintainable**: Single source of truth for LoRaWAN types
5. ✅ **Git Submodule**: Proper versioning and dependency management

## Files Modified

- `protobuf/external/service/inventory.proto` - Updated imports
- `go/Makefile` - Added proper include paths
- `swagger/Makefile` - Added proper include paths  
- `protobuf/lorawan/` - Created namespace via symbolic links
- Added git submodule: `vendor/console-lorawan-api`

## Usage Example

When creating a LoRaWAN device in inventory:

```json
{
  "eui": "1234567890abcdef",
  "device_type": "LORAWAN",
  "configuration": {
    "lorawan_device": {
      "dev_eui": "1234567890abcdef",
      "name": "My LoRaWAN Device",
      "application_id": "app-123",
      "device_class": "CLASS_A",
      "device_join_mode": "OTAA",
      "region": "EU868",
      "keys": {
        "nwk_key": "...",
        "app_key": "..."
      }
      // Full console-lorawan-api Device configuration
    }
  }
}
```

This approach gives you the best of both worlds: proper separation of concerns while maximizing code reuse!

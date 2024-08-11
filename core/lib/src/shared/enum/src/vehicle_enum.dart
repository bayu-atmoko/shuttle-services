enum VehicleEnum {
  truck,
  miniTruck,
  motor;

  String get title {
    switch (this) {
      case VehicleEnum.truck:
        return 'Truk';
      case VehicleEnum.miniTruck:
        return 'Mobil bak / mini truk';
      case VehicleEnum.motor:
        return 'Motor';
      default:
        return '';
    }
  }

  String get value {
    switch (this) {
      case VehicleEnum.truck:
        return 'truck';
      case VehicleEnum.miniTruck:
        return 'mini-truck';
      case VehicleEnum.motor:
        return 'motor';
      default:
        return '';
    }
  }
}

class VehicleEnumHelper {
  static VehicleEnum? getEnumBasedOnTitle(String value) {
    switch (value) {
      case 'Truk':
        return VehicleEnum.truck;
      case 'Mobil bak / mini truk':
        return VehicleEnum.miniTruck;
      case 'Motor':
        return VehicleEnum.motor;
      default:
        return null;
    }
  }

  static VehicleEnum? getEnumBasedOnValue(String value) {
    switch (value) {
      case 'truck':
        return VehicleEnum.truck;
      case 'mini-truck':
        return VehicleEnum.miniTruck;
      case 'motor':
        return VehicleEnum.motor;
      default:
        return null;
    }
  }
}

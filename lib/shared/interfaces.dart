class GasReading {
  double price;
  String unit = 'm³';
  double usedUnit;
  String name;
  GasReading(
      {required this.price,
      required this.usedUnit,
      required this.name,
      this.unit = 'm³'});
}

class ElectricReading {
  double price;
  String unit = 'kWh';
  double usedUnit;
  String name;
  ElectricReading(
      {required this.price,
      required this.usedUnit,
      required this.name,
      this.unit = 'kWh'});
}

class MeterReading {
  double price;
  String unit = 'm³';
  double usedUnit;
  String name;
  String meterType;
  DeviceInfo deviceInfo;
  MeterReading({
    required this.price,
    required this.usedUnit,
    required this.name,
    required this.meterType,
    this.unit = 'm³',
    required this.deviceInfo,
  });

  toStringValue() {
    return {
      "price": price,
      "name": name,
      "unit": unit,
      "used_unit": usedUnit,
      "type": meterType,
      "device_info": deviceInfo.toStringValue()
    };
  }

  static check() {}
}

class DeviceInfo {
  String name;
  String company;
  String model;
  String category;
  DeviceInfo(
      {required this.name,
      required this.company,
      required this.model,
      required this.category});
  toStringValue() {
    return {
      "name": name,
      "company": company,
      "model": model,
      "category": category
    };
  }
}

class Auth {
  String userName;
  String password;
  String userId;
  Auth({required this.userId, required this.password, required this.userName});

  String toStringValue() {
    return {'userName': userName, 'password': password, 'userId': userId}
        .toString();
  }
}

class UserInfo {
  String userName;
  String userEmail;
  String userId;
  UserInfo(
      {required this.userEmail, required this.userId, required this.userName});

  String toStringValue() {
    return {'userName': userName, 'userEmail': userEmail, 'userId': userId}
        .toString();
  }
}

enum Meter { gas, electric, water }

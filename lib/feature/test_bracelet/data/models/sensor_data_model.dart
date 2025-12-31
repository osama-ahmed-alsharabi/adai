class SensorDataModel {
  final int heartRate;
  final int spo2;
  final double temperature;
  final bool handDetected;
  final AccelerationModel acceleration;
  final GyroscopeModel gyroscope;

  SensorDataModel({
    required this.heartRate,
    required this.spo2,
    required this.temperature,
    required this.handDetected,
    required this.acceleration,
    required this.gyroscope,
  });

  factory SensorDataModel.fromJson(Map<String, dynamic> json) {
    final max30102 = json['max30102'] as Map<String, dynamic>;
    final mpu6050 = json['mpu6050'] as Map<String, dynamic>;

    return SensorDataModel(
      heartRate: max30102['heartRate'] ?? 0,
      spo2: max30102['spo2'] ?? 0,
      temperature: (max30102['temperature'] ?? 0.0).toDouble(),
      handDetected: max30102['handDetected'] ?? false,
      acceleration: AccelerationModel.fromJson(
        mpu6050['acceleration'] as Map<String, dynamic>,
      ),
      gyroscope: GyroscopeModel.fromJson(
        mpu6050['gyroscope'] as Map<String, dynamic>,
      ),
    );
  }
}

class AccelerationModel {
  final int x;
  final int y;
  final int z;

  AccelerationModel({required this.x, required this.y, required this.z});

  factory AccelerationModel.fromJson(Map<String, dynamic> json) {
    return AccelerationModel(
      x: json['x'] ?? 0,
      y: json['y'] ?? 0,
      z: json['z'] ?? 0,
    );
  }
}

class GyroscopeModel {
  final int x;
  final int y;
  final int z;

  GyroscopeModel({required this.x, required this.y, required this.z});

  factory GyroscopeModel.fromJson(Map<String, dynamic> json) {
    return GyroscopeModel(
      x: json['x'] ?? 0,
      y: json['y'] ?? 0,
      z: json['z'] ?? 0,
    );
  }
}

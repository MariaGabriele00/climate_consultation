import '../../domain/domain.dart';

extension WeatherMapper on WeatherEntity {
  static WeatherEntity fromMap(Map<String, dynamic> map) {
    final mainMap = map['main'];

    return WeatherEntity(
      temp: (mainMap['temp'] as num).toDouble(),
      minTemp: (mainMap['temp_min'] as num).toDouble(),
      maxTemp: (mainMap['temp_max'] as num).toDouble(),
      humidity: (mainMap['humidity'] as num).toDouble(),
    );
  }
}

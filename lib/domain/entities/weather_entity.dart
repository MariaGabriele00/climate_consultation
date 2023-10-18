import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_entity.freezed.dart';

@freezed
sealed class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required double temp,
    required double minTemp,
    required double maxTemp,
    required double humidity,
  }) = _WeatherEntity;

  factory WeatherEntity.init() {
    return const WeatherEntity(
      temp: 0,
      minTemp: 0,
      maxTemp: 0,
      humidity: 0,
    );
  }
}

import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final double temp;
  final double minTemp;
  final double maxTemp;
  final double humidity;

  const WeatherEntity({
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
  });

  @override
  List<Object?> get props => [
        temp,
        minTemp,
        maxTemp,
        humidity,
      ];
}

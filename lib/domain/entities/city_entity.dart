import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String name;
  final String state;
  final String country;
  final double lon;
  final double lag;

  const CityEntity({
    required this.name,
    required this.state,
    required this.country,
    required this.lon,
    required this.lag,
  });

  @override
  List<Object?> get props => [
        name,
        state,
        country,
        lon,
        lag,
      ];
}

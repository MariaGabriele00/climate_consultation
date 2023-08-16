import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String id;
  final String name;
  final String state;
  final String country;
  final double lon;
  final double lat;

  const CityEntity({
    required this.id,
    required this.name,
    required this.state,
    required this.country,
    required this.lon,
    required this.lat,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        state,
        country,
        lon,
        lat,
      ];
}

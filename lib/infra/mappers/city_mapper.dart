import '../../domain/domain.dart';

extension CityMapper on CityEntity {
  static List<CityEntity> fromJson(List<dynamic> json) {
    return json.map(_fromMap).toList();
  }

  static CityEntity _fromMap(dynamic map) {
    final state = (map as Map<String, dynamic>).containsKey('state')
        ? map['state'] as String
        : '';

    return CityEntity.init(
      name: map['name'] as String,
      state: state,
      country: map['country'] as String,
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }
}

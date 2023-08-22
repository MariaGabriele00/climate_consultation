import '../../domain/domain.dart';

extension CityMapper on CityEntity {
  static List<CityEntity> fromJson(List<dynamic> json) {
    // ignore: unnecessary_lambdas
    return json.map((map) => _fromMap(map)).toList();
  }

  static CityEntity _fromMap(Map<String, dynamic> map) {
    return CityEntity.init(
      name: map['name'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      lon: map['lon'] as double,
      lat: map['lat'] as double,
    );
  }
}

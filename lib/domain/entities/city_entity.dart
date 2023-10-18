import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'city_entity.freezed.dart';

@freezed
sealed class CityEntity with _$CityEntity {
  const factory CityEntity._({
    required String id,
    required String name,
    required String state,
    required String country,
    required double lon,
    required double lat,
  }) = _CityEntity;

  factory CityEntity.init({
    required String name,
    required String state,
    required String country,
    required double lon,
    required double lat,
  }) {
    return CityEntity._(
      id: const Uuid().v4(),
      name: name,
      state: state,
      country: country,
      lon: lon,
      lat: lat,
    );
  }
}

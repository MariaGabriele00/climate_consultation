import 'entities/entities.dart';

abstract interface class WeatherRepository {
  Future<WeatherEntity> searchByLocation({
    required double lon,
    required double lat,
  });

  Future<WeatherEntity> searchByGeolocation();
}

import 'package:dartz/dartz.dart';
import 'package:uno/uno.dart';

import '../domain/domain.dart';
import 'mappers/mappers.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Uno client;
  final String url;
  final String appId;

  const WeatherRepositoryImpl({
    required this.client,
    required this.url,
    required this.appId,
  });

  @override
  Future<Either<WeatherFailure, WeatherEntity>> searchByLocation({
    required double lon,
    required double lat,
  }) async {
    final response = await client.get(
      '$url/data/2.5/weather?lat=$lat&lon=$lon&APPID=$appId&units=metric',
    );

    if (response.status == 200) {
      return right(WeatherMapper.fromMap(response.data));
    }

    return left(const WeatherFailure.notFoundWeatherFailure());
  }
}

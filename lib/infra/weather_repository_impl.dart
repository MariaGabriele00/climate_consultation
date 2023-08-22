import 'package:uno/uno.dart';

import '../domain/domain.dart';
import 'mappers/mappers.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Uno client;
  final String url;
  final String appId;

  WeatherRepositoryImpl({
    required this.client,
    required this.url,
    required this.appId,
  });
  @override
  Future<WeatherEntity> searchByLocation({
    required double lon,
    required double lat,
  }) async {
    final response = await client.get(
      '$url/data/2.5/weather?lat=$lat&lon=$lon&APPID=$appId&units=metric',
    );
    if (response.status == 200) {
      return WeatherMapper.fromMap(response.data);
    }
    throw Exception('Não foi encontrado nenhuma previsão.');
  }
}

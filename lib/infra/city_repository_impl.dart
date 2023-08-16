import 'package:uno/uno.dart';

import '../domain/domain.dart';
import 'mappers/mappers.dart';

//https://api.openweathermap.org/geo/1.0/direct?q={{ Nome da cidade }}&limit=5&lang=pt_br&APPID={{ A SUA CHAVE DO SITE }}
class CityRepositoryImpl implements CityRepository {
  final Uno client;
  final String url;
  final String appId;

  const CityRepositoryImpl({
    required this.client,
    required this.url,
    required this.appId,
  });
  @override
  Future<List<CityEntity>> searchByName({required String nameCity}) async {
    final response = await client.get(
      '$url/geo/1.0/direct?q=$nameCity&limit=5&lang=pt_br&APPID=$appId',
    );
    if (response.status == 200) {
      return CityMapper.fromJson(response.data);
    }
    throw Exception('Não foi possível encontrar a cidade.');
  }
}

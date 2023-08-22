import 'package:geolocator/geolocator.dart';
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
    throw const FormatException('Não foi possível encontrar a cidade.');
  }

  @override
  Future<CityEntity> searchByGeolocation() async {
    var serviceEnabled = false;
    late LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const FormatException('Seu GPS está desativado.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const FormatException(
          'Precisa da permissão para encontrar sua localicação',
        );
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw const FormatException(
        'Permissão de localização negada permanentemente',
      );
    }
    final position = await Geolocator.getCurrentPosition();
    return CityEntity.init(
      name: '',
      state: '',
      country: 'country',
      lon: position.longitude,
      lat: position.latitude,
    );
  }
}

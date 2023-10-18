import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uno/uno.dart';

import '../domain/domain.dart';
import 'mappers/mappers.dart';

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
  Future<Either<CityFailure, List<CityEntity>>> searchByName({
    required String nameCity,
  }) async {
    final response = await client.get(
      '$url/geo/1.0/direct?q=$nameCity&limit=5&lang=pt_br&APPID=$appId',
    );

    final failureDefault = CityFailure.unexpectedCityFailure(
      message: 'Não foi possível encontrar a cidade: $nameCity',
    );

    if (response.status == 200) {
      final cities = CityMapper.fromJson(response.data);
      if (cities.isNotEmpty) return right(cities);
      return left(failureDefault);
    }

    return left(failureDefault);
  }

  @override
  Future<Either<CityFailure, CityEntity>> searchByGeolocation() async {
    var serviceEnabled = false;
    late LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return left(
        const CityFailure.unexpectedCityFailure(
          message: 'GPS está desativado.',
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return left(
          const CityFailure.unexpectedCityFailure(
            message: 'Precisar dar permissão para encontrar sua localização.',
          ),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return left(
        const CityFailure.unexpectedCityFailure(
          message: 'Permissão de localização negada permanentemente.',
        ),
      );
    }

    final position = await Geolocator.getCurrentPosition();
    return right(
      CityEntity.init(
        name: '',
        state: '',
        country: '',
        lon: position.longitude,
        lat: position.latitude,
      ),
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:climate_consultation/domain/domain.dart';
import 'package:climate_consultation/infra/infra.dart';
import 'package:uno/uno.dart';

class MockUno extends Mock implements Uno {}

void main() {
  late WeatherRepository sut;
  late MockUno network;
  const url = 'ANY_URL';
  const appId = 'ANY_APP_IP';
  const lat = 22.22;
  const lon = 11.11;

  final apiResult = {
    'coord': {'lon': -51.9382, 'lat': -23.4253},
    'weather': [
      {'id': 800, 'main': 'Clear', 'description': 'clear sky', 'icon': '01d'}
    ],
    'base': 'stations',
    'main': {
      'temp': 23,
      'feels_like': 25.81,
      'temp_min': 25.93,
      'temp_max': 25.93,
      'pressure': 1023,
      'humidity': 47
    },
    'visibility': 10000,
    'wind': {'speed': 3.6, 'deg': 60},
    'clouds': {'all': 0},
    'dt': 1690209533,
    'sys': {
      'type': 1,
      'id': 8387,
      'country': 'BR',
      'sunrise': 1690193178,
      'sunset': 1690232513
    },
    'timezone': -10800,
    'id': 3457671,
    'name': 'Maringá',
    'cod': 200
  };
  Response unoResponse({required int statusCode, dynamic data}) {
    return Response(
      headers: {},
      request: Request(
        uri: Uri(),
        method: 'GET',
        headers: {},
        timeout: const Duration(seconds: 1),
      ),
      status: statusCode,
      data: data ?? apiResult,
    );
  }

  setUp(() {
    network = MockUno();

    sut = WeatherRepositoryImpl(
      client: network,
      url: url,
      appId: appId,
    );
    when(() => network.get(any())).thenAnswer(
      (_) async => unoResponse(statusCode: 200),
    );
  });

  test('deve verificar se está recebendo os parâmetros corretos', () async {
    await sut.searchByLocation(lon: lon, lat: lat);

    verify(
      () => network.get(
        '$url/data/2.5/weather?lat=$lat&lon=$lon&APPID=$appId&units=metric',
      ),
    ).called(1);
  });

  test('deve retornar um MAP quando tiver sucesso da API', () async {
    final response = await sut.searchByLocation(lon: lon, lat: lat);
    expect(response.temp, 23.0);
    expect(response.minTemp, 25.93);
    expect(response.maxTemp, 25.93);
  });
  test(
    'deve informar um erro quando tiver falha da API',
    () async {
      when(() => network.get(any())).thenAnswer(
        (_) async => unoResponse(statusCode: 500, data: {}),
      );
      expect(
        () async => sut.searchByLocation(lon: lon, lat: lat),
        throwsException,
      );
    },
  );
}

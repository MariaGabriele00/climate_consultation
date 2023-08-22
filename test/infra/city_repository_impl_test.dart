import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:climate_consultation/domain/domain.dart';
import 'package:climate_consultation/infra/infra.dart';
import 'package:uno/uno.dart';

class MockUno extends Mock implements Uno {}

void main() {
  late CityRepository sut;
  late MockUno network;
  const url = 'ANY_URL';
  const appId = 'ANY_APP_IP';
  const nameCity = 'Maringá';

  final apiResult = [
    {
      'name': 'Maringá',
      'lat': -23.425269,
      'lon': -51.9382078,
      'country': 'BR',
      'state': 'Paraná'
    },
    {
      'name': 'Maringá',
      'lat': -23.2275113,
      'lon': -46.8797287,
      'country': 'BR',
      'state': 'São Paulo'
    },
    {
      'name': 'Maringá',
      'lat': -19.7609894,
      'lon': -47.8840903,
      'country': 'BR',
      'state': 'Minas Gerais'
    }
  ];
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

    sut = CityRepositoryImpl(
      client: network,
      url: url,
      appId: appId,
    );
    when(() => network.get(any())).thenAnswer(
      (_) async => unoResponse(statusCode: 200),
    );
  });

  test('deve verificar se está recebendo os parâmetros corretos', () async {
    await sut.searchByName(nameCity: nameCity);

    verify(
      () => network.get(
        '$url/geo/1.0/direct?q=$nameCity&limit=5&lang=pt_br&APPID=$appId',
      ),
    ).called(1);
  });
  test('deve retornar uma cidade e o estado quando tiver sucesso', () async {
    final response = await sut.searchByName(nameCity: nameCity);
    expect(response[1].name, 'Maringá');
    expect(response[1].state, 'São Paulo');
    expect(response[1].state, 'São Paulo');
  });
  test(
    'deve informar um erro quando tiver falha da API',
    () async {
      when(() => network.get(any())).thenAnswer(
        (_) async => unoResponse(statusCode: 500, data: {}),
      );
      expect(
        () async => sut.searchByName(nameCity: nameCity),
        throwsException,
      );
    },
  );
}

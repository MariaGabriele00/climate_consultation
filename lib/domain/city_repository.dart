import 'entities/entities.dart';

abstract interface class CityRepository {
  Future<List<CityEntity>> searchByName({required String nameCity});
}

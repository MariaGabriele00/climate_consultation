import 'entities/entities.dart';

abstract class CityRepository {
  Future<List<CityEntity>> searchByName({required String nameCity});
}

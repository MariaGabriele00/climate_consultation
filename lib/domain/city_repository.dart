import 'entities/entities.dart';

abstract class CityRepository {
  List<CityEntity> searchByName({required String nameCity});
}

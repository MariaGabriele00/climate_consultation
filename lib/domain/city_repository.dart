import 'package:dartz/dartz.dart';

import 'entities/entities.dart';
import 'failures/failures.dart';

abstract interface class CityRepository {
  Future<Either<CityFailure, List<CityEntity>>> searchByName({
    required String nameCity,
  });

  Future<Either<CityFailure, CityEntity>> searchByGeolocation();
}

import 'package:dartz/dartz.dart';

import 'entities/entities.dart';
import 'failures/failures.dart';

abstract interface class WeatherRepository {
  Future<Either<WeatherFailure, WeatherEntity>> searchByLocation({
    required double lon,
    required double lat,
  });
}

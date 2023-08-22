import '../../presentation/presentation.dart';
import 'weather_repository_factory.dart';

WeatherCubit weatherCubitFactory() {
  return WeatherCubit(
    repository: weatherRepositoryFactory(),
  );
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  late final CityEntity currentCity;
  WeatherCubit({
    required this.repository,
  }) : super(WeatherLoadingState());
  Future<void> searchByLocation(CityEntity city) async {
    currentCity = city;
    final response = await repository.searchByLocation(
      lon: city.lon,
      lat: city.lat,
    );
    emit(WeatherDataFoundState(response));
  }

  void resfreshWeather() {
    emit(WeatherLoadingState());
    searchByLocation(currentCity);
  }

  void consultAnotherCity() {}
}

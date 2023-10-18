import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit({
    required this.repository,
  }) : super(WeatherState.init());

  Future<void> searchByLocation(CityEntity city) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    final response = await repository.searchByLocation(
      lon: city.lon,
      lat: city.lat,
    );

    final newState = response.fold(
      (newFailure) => state.copyWith(
        failure: newFailure,
      ),
      (newWeather) => state.copyWith(
        weather: newWeather,
        failure: null,
      ),
    );

    emit(
      newState.copyWith(
        isLoading: false,
        currentCity: city,
      ),
    );
  }
}

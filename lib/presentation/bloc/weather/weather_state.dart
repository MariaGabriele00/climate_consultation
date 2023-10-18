part of 'weather_cubit.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState({
    required bool isLoading,
    required WeatherEntity weather,
    required CityEntity? currentCity,
    required WeatherFailure? failure,
  }) = _WeatherState;

  factory WeatherState.init() {
    return WeatherState(
      isLoading: true,
      weather: WeatherEntity.init(),
      currentCity: null,
      failure: null,
    );
  }
}

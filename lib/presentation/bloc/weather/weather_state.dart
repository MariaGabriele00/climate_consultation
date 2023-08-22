part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherLoadingState extends WeatherState {}

final class WeatherDataFoundState extends WeatherState {
  final WeatherEntity weather;
  const WeatherDataFoundState(this.weather);

  @override
  List<Object> get props => [weather];
}

final class WeatherFailureState extends WeatherState {
  final String errorMessage;
  const WeatherFailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

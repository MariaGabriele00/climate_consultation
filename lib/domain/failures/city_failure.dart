import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_failure.freezed.dart';

@freezed
sealed class CityFailure with _$CityFailure {
  const CityFailure._();

  const factory CityFailure.notFoundCityFailure() = _NotFoundCityFailure;
  const factory CityFailure.unexpectedCityFailure({
    required String message,
  }) = _UnexpectedCityFailure;

  String toMessage() {
    return switch (this) {
      _NotFoundCityFailure() => 'Nenhuma cidade encontrada',
      _UnexpectedCityFailure(:final message) => message,
    };
  }
}

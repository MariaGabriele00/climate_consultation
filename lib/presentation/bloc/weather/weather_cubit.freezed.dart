// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherState {
  bool get isLoading => throw _privateConstructorUsedError;
  WeatherEntity get weather => throw _privateConstructorUsedError;
  CityEntity? get currentCity => throw _privateConstructorUsedError;
  WeatherFailure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {bool isLoading,
      WeatherEntity weather,
      CityEntity? currentCity,
      WeatherFailure? failure});

  $WeatherEntityCopyWith<$Res> get weather;
  $CityEntityCopyWith<$Res>? get currentCity;
  $WeatherFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? weather = null,
    Object? currentCity = freezed,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherEntity,
      currentCity: freezed == currentCity
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as CityEntity?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as WeatherFailure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherEntityCopyWith<$Res> get weather {
    return $WeatherEntityCopyWith<$Res>(_value.weather, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityEntityCopyWith<$Res>? get currentCity {
    if (_value.currentCity == null) {
      return null;
    }

    return $CityEntityCopyWith<$Res>(_value.currentCity!, (value) {
      return _then(_value.copyWith(currentCity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherFailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $WeatherFailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      WeatherEntity weather,
      CityEntity? currentCity,
      WeatherFailure? failure});

  @override
  $WeatherEntityCopyWith<$Res> get weather;
  @override
  $CityEntityCopyWith<$Res>? get currentCity;
  @override
  $WeatherFailureCopyWith<$Res>? get failure;
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? weather = null,
    Object? currentCity = freezed,
    Object? failure = freezed,
  }) {
    return _then(_$WeatherStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherEntity,
      currentCity: freezed == currentCity
          ? _value.currentCity
          : currentCity // ignore: cast_nullable_to_non_nullable
              as CityEntity?,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as WeatherFailure?,
    ));
  }
}

/// @nodoc

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {required this.isLoading,
      required this.weather,
      required this.currentCity,
      required this.failure});

  @override
  final bool isLoading;
  @override
  final WeatherEntity weather;
  @override
  final CityEntity? currentCity;
  @override
  final WeatherFailure? failure;

  @override
  String toString() {
    return 'WeatherState(isLoading: $isLoading, weather: $weather, currentCity: $currentCity, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.currentCity, currentCity) ||
                other.currentCity == currentCity) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, weather, currentCity, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {required final bool isLoading,
      required final WeatherEntity weather,
      required final CityEntity? currentCity,
      required final WeatherFailure? failure}) = _$WeatherStateImpl;

  @override
  bool get isLoading;
  @override
  WeatherEntity get weather;
  @override
  CityEntity? get currentCity;
  @override
  WeatherFailure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_of_cities_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListOfCitiesState {
  List<CityEntity> get cities => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<CityFailure, CityEntity>> get failureOrCompanySelected =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListOfCitiesStateCopyWith<ListOfCitiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfCitiesStateCopyWith<$Res> {
  factory $ListOfCitiesStateCopyWith(
          ListOfCitiesState value, $Res Function(ListOfCitiesState) then) =
      _$ListOfCitiesStateCopyWithImpl<$Res, ListOfCitiesState>;
  @useResult
  $Res call(
      {List<CityEntity> cities,
      bool isLoading,
      Option<Either<CityFailure, CityEntity>> failureOrCompanySelected});
}

/// @nodoc
class _$ListOfCitiesStateCopyWithImpl<$Res, $Val extends ListOfCitiesState>
    implements $ListOfCitiesStateCopyWith<$Res> {
  _$ListOfCitiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? isLoading = null,
    Object? failureOrCompanySelected = null,
  }) {
    return _then(_value.copyWith(
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrCompanySelected: null == failureOrCompanySelected
          ? _value.failureOrCompanySelected
          : failureOrCompanySelected // ignore: cast_nullable_to_non_nullable
              as Option<Either<CityFailure, CityEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOfCitiesStateImplCopyWith<$Res>
    implements $ListOfCitiesStateCopyWith<$Res> {
  factory _$$ListOfCitiesStateImplCopyWith(_$ListOfCitiesStateImpl value,
          $Res Function(_$ListOfCitiesStateImpl) then) =
      __$$ListOfCitiesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CityEntity> cities,
      bool isLoading,
      Option<Either<CityFailure, CityEntity>> failureOrCompanySelected});
}

/// @nodoc
class __$$ListOfCitiesStateImplCopyWithImpl<$Res>
    extends _$ListOfCitiesStateCopyWithImpl<$Res, _$ListOfCitiesStateImpl>
    implements _$$ListOfCitiesStateImplCopyWith<$Res> {
  __$$ListOfCitiesStateImplCopyWithImpl(_$ListOfCitiesStateImpl _value,
      $Res Function(_$ListOfCitiesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cities = null,
    Object? isLoading = null,
    Object? failureOrCompanySelected = null,
  }) {
    return _then(_$ListOfCitiesStateImpl(
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrCompanySelected: null == failureOrCompanySelected
          ? _value.failureOrCompanySelected
          : failureOrCompanySelected // ignore: cast_nullable_to_non_nullable
              as Option<Either<CityFailure, CityEntity>>,
    ));
  }
}

/// @nodoc

class _$ListOfCitiesStateImpl extends _ListOfCitiesState {
  const _$ListOfCitiesStateImpl(
      {required final List<CityEntity> cities,
      required this.isLoading,
      required this.failureOrCompanySelected})
      : _cities = cities,
        super._();

  final List<CityEntity> _cities;
  @override
  List<CityEntity> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  final bool isLoading;
  @override
  final Option<Either<CityFailure, CityEntity>> failureOrCompanySelected;

  @override
  String toString() {
    return 'ListOfCitiesState(cities: $cities, isLoading: $isLoading, failureOrCompanySelected: $failureOrCompanySelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOfCitiesStateImpl &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(
                    other.failureOrCompanySelected, failureOrCompanySelected) ||
                other.failureOrCompanySelected == failureOrCompanySelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cities),
      isLoading,
      failureOrCompanySelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOfCitiesStateImplCopyWith<_$ListOfCitiesStateImpl> get copyWith =>
      __$$ListOfCitiesStateImplCopyWithImpl<_$ListOfCitiesStateImpl>(
          this, _$identity);
}

abstract class _ListOfCitiesState extends ListOfCitiesState {
  const factory _ListOfCitiesState(
      {required final List<CityEntity> cities,
      required final bool isLoading,
      required final Option<Either<CityFailure, CityEntity>>
          failureOrCompanySelected}) = _$ListOfCitiesStateImpl;
  const _ListOfCitiesState._() : super._();

  @override
  List<CityEntity> get cities;
  @override
  bool get isLoading;
  @override
  Option<Either<CityFailure, CityEntity>> get failureOrCompanySelected;
  @override
  @JsonKey(ignore: true)
  _$$ListOfCitiesStateImplCopyWith<_$ListOfCitiesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

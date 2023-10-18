part of 'list_of_cities_bloc.dart';

@freezed
sealed class ListOfCitiesState with _$ListOfCitiesState {
  const factory ListOfCitiesState({
    required List<CityEntity> cities,
    required bool isLoading,
    required Option<Either<CityFailure, CityEntity>> failureOrCompanySelected,
  }) = _ListOfCitiesState;

  factory ListOfCitiesState.init() {
    return ListOfCitiesState(
      cities: [],
      isLoading: false,
      failureOrCompanySelected: none(),
    );
  }
  bool get hasFailure {
    return failureOrCompanySelected.fold(
      () => false,
      (failureOrCompany) => failureOrCompany.isLeft(),
    );
  }

  String get errorMessage {
    return failureOrCompanySelected.fold(
      () => '',
      (failureOrCompany) => failureOrCompany.fold(
        (failure) => failure.toMessage(),
        (_) => '',
      ),
    );
  }

  const ListOfCitiesState._();
}

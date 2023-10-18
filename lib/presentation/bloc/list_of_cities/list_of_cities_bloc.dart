import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';

part 'list_of_cities_event.dart';
part 'list_of_cities_state.dart';
part 'list_of_cities_bloc.freezed.dart';

class ListOfCitiesBloc extends Bloc<ListOfCitiesEvent, ListOfCitiesState> {
  final CityRepository repository;

  String searchText = '';

  ListOfCitiesBloc({
    required this.repository,
  }) : super(ListOfCitiesState.init()) {
    on<SearchedEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await repository.searchByName(nameCity: searchText);

      final newState = response.fold(
        (newFailure) => state.copyWith(
          failureOrCompanySelected: optionOf(left(newFailure)),
        ),
        (newCities) => state.copyWith(
          cities: newCities,
          failureOrCompanySelected: none(),
        ),
      );

      emit(newState.copyWith(isLoading: false));
    });

    on<SearchWithGeolocationEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await repository.searchByGeolocation();

      final newState = response.fold(
        (newFailure) => state.copyWith(
          failureOrCompanySelected: optionOf(left(newFailure)),
        ),
        (newCity) => state.copyWith(
          failureOrCompanySelected: optionOf(right(newCity)),
        ),
      );

      emit(newState.copyWith(isLoading: false));
    });

    on<FieldChangedEvent>((event, emit) {
      searchText = event.value;
    });

    on<CitySelectedEvent>((event, emit) {
      final citySelected =
          state.cities.firstWhere((city) => city.id == event.cityId);
      final newState = state.copyWith(
        failureOrCompanySelected: optionOf(right(citySelected)),
      );

      emit(newState.copyWith(isLoading: false));
    });

    on<RestartedEvent>((event, emit) {
      emit(ListOfCitiesState.init());
    });
  }
}

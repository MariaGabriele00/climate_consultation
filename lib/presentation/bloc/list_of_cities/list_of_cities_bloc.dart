import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'list_of_cities_event.dart';
part 'list_of_cities_state.dart';

class ListOfCitiesBloc extends Bloc<ListOfCitiesEvent, ListOfCitiesState> {
  final CityRepository repository;
  String searchText = '';
  List<CityEntity> cities = [];
  CityEntity? citySelected;
  ListOfCitiesBloc({
    required this.repository,
  }) : super(ListOfCitiesInitial()) {
    on<ListOfCitiesFieldChanged>((event, emit) {
      searchText = event.value;
    });
    on<ListOfCitiesSearched>((event, emit) async {
      emit(ListOfCitiesLoading());
      final response = await repository.searchByName(nameCity: searchText);
      if (response.isNotEmpty) {
        cities = response;
        emit(ListOfCitiesDataFound(cities: response));
      } else {
        emit(ListOfCitiesNotFound());
      }
    });
    on<ListOfCitiesCitySelected>((event, emit) {
      citySelected = cities.firstWhere((city) => city.id == event.cityId);
    });
    on<ListOfCitiesRestarted>((event, emit) {
      emit(ListOfCitiesInitial());
    });
  }
}

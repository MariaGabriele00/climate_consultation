part of 'list_of_cities_bloc.dart';

sealed class ListOfCitiesEvent extends Equatable {
  const ListOfCitiesEvent();

  @override
  List<Object> get props => [];
}

final class ListOfCitiesFieldChanged extends ListOfCitiesEvent {
  final String value;
  const ListOfCitiesFieldChanged({
    required this.value,
  });
}

final class ListOfCitiesSearched extends ListOfCitiesEvent {}

final class ListOfCitiesCitySelected extends ListOfCitiesEvent {
  final String cityId;

  const ListOfCitiesCitySelected({
    required this.cityId,
  });
}

final class ListOfCitiesRestarted extends ListOfCitiesEvent {}

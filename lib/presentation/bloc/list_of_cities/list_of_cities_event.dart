part of 'list_of_cities_bloc.dart';

sealed class ListOfCitiesEvent extends Equatable {
  const ListOfCitiesEvent();

  @override
  List<Object> get props => [];
}

final class FieldChangedEvent extends ListOfCitiesEvent {
  final String value;

  const FieldChangedEvent({
    required this.value,
  });
}

final class SearchedEvent extends ListOfCitiesEvent {}

final class CitySelectedEvent extends ListOfCitiesEvent {
  final String cityId;

  const CitySelectedEvent({
    required this.cityId,
  });
}

final class RestartedEvent extends ListOfCitiesEvent {}

final class SearchWithGeolocationEvent extends ListOfCitiesEvent {}

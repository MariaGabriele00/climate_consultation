part of 'list_of_cities_bloc.dart';

sealed class ListOfCitiesState extends Equatable {
  const ListOfCitiesState();

  @override
  List<Object> get props => [];
}

final class ListOfCitiesInitial extends ListOfCitiesState {}

final class ListOfCitiesLoading extends ListOfCitiesState {}

final class ListOfCitiesNotFound extends ListOfCitiesState {}

final class ListOfCitiesDataFound extends ListOfCitiesState {
  final List<CityEntity> cities;
  const ListOfCitiesDataFound({required this.cities});
  @override
  List<Object> get props => [cities];
}

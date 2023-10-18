import '../../presentation/presentation.dart';
import 'city_repository_factory.dart';

ListOfCitiesBloc listOfCitiesBlocFactory() {
  return ListOfCitiesBloc(
    repository: cityReopsitoryFactory(),
  );
}

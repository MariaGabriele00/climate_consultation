import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main/factories/factories.dart';
import '../../../bloc/bloc.dart';
import 'widgets/widgets.dart';

class ListOfCitiesPage extends StatefulWidget {
  const ListOfCitiesPage({super.key});

  @override
  State<ListOfCitiesPage> createState() => _ListOfCitiesPageState();
}

class _ListOfCitiesPageState extends State<ListOfCitiesPage> {
  late final ListOfCitiesBloc bloc;

  @override
  void initState() {
    bloc = listOfCitiesBlocFactory();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListOfCitiesBloc, ListOfCitiesState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is CitySelectedState) {
          Navigator.of(context).popAndPushNamed(
            '/weather-detail',
            arguments: state.city,
          );
        }
      },
      builder: (context, state) {
        void restartPage() {
          bloc.add(RestartedEvent());
        }

        void searchText(String value) {
          bloc.add(FieldChangedEvent(value: value));
        }

        void searched() {
          bloc.add(SearchedEvent());
        }

        return Scaffold(
          backgroundColor: Colors.teal,
          floatingActionButton: Visibility(
            visible: state is! FailureState,
            child: FloatingActionButton(
              tooltip: 'Sua posição está aqui',
              child: const Icon(Icons.pin_drop_outlined),
              onPressed: () {
                bloc.add(SearchWithGeolocatorEvent());
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: switch (state) {
              LoadingState() ||
              CitySelectedState() =>
                const CityLoadingWidget(),
              FailureState(:final errorMessage) => FailureWidget(
                  errorMessage: errorMessage,
                  restartPage: restartPage,
                ),
              InitialState() => Center(
                  child: SearchFieldWidget(
                    onChanged: searchText,
                    onPressed: searched,
                  ),
                ),
              DataFoundState(:final cities) => CityListWidget(
                  cities: cities,
                  onChanged: searchText,
                  onPressed: searched,
                  onSelectCity: (
                    cityId,
                  ) {
                    bloc.add(
                      CitySelectedEvent(
                        cityId: cityId,
                      ),
                    );
                  },
                ),
            },
          ),
        );
      },
    );
  }
}

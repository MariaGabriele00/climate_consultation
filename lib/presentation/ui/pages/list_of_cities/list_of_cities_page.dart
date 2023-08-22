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
          backgroundColor: const Color.fromARGB(255, 103, 131, 128),
          appBar: AppBar(
            title: const Text('C O N S U L T E   O   C L I M A'),
            backgroundColor: const Color.fromARGB(255, 103, 131, 128),
            centerTitle: true,
          ),
          floatingActionButton: Visibility(
            visible: state is! FailureState,
            child: FloatingActionButton(
              tooltip: 'Sua posição está aqui',
              backgroundColor: const Color.fromARGB(255, 103, 131, 128),
              child: const Icon(Icons.pin_drop_outlined),
              onPressed: () {
                bloc.add(SearchWithGeolocatorEvent());
              },
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/3774895/pexels-photo-3774895.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
                opacity: 0.6,
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
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
          ),
        );
      },
    );
  }
}

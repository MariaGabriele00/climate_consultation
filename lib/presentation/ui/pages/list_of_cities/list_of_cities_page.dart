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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de cidades'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<ListOfCitiesBloc, ListOfCitiesState>(
          bloc: bloc,
          builder: (context, state) {
            void restartPage() {
              bloc.add(ListOfCitiesRestarted());
            }

            void searchText(String value) {
              bloc.add(ListOfCitiesFieldChanged(value: value));
            }

            void searched() {
              bloc.add(ListOfCitiesSearched());
            }

            if (state is ListOfCitiesInitial) {
              return Center(
                child: SearchFieldWidget(
                  onChanged: searchText,
                  onPressed: searched,
                ),
              );
            }
            if (state is ListOfCitiesLoading) {
              return const CityLoadingWidget();
            }

            if (state is ListOfCitiesNotFound) {
              return CityNotFoundWidget(restartPage: restartPage);
            }

            if (state is ListOfCitiesDataFound) {
              return CityListWidget(
                cities: state.cities,
                onChanged: searchText,
                onPressed: searched,
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

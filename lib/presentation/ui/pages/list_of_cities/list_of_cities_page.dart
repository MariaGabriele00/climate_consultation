import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main/factories/factories.dart';
import '../../../bloc/bloc.dart';

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
            if (state is ListOfCitiesInitial) {
              return TextFormField(
                onChanged: (value) {
                  bloc.add(ListOfCitiesFieldChanged(value: value));
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Digite o nome da cidade',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      bloc.add(ListOfCitiesSearched());
                    },
                  ),
                ),
              );
            }
            if (state is ListOfCitiesLoading) {
              return const CircularProgressIndicator();
            }
            if (state is ListOfCitiesNotFound) {
              return const Text('Nenhuma cidade encontrada');
            }
            if (state is ListOfCitiesDataFound) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Digite o nome da cidade',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state.cities.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.cities.length,
                        itemBuilder: (context, index) {
                          final city = state.cities[index];
                          return ListTile(
                            onTap: () {},
                            title: Text(city.name),
                            subtitle: Text('${city.state} - ${city.country}'),
                            trailing: Image.network(
                              'https://openweathermap.org/images/flags/${city.country.toLowerCase()}.png',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.radar);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

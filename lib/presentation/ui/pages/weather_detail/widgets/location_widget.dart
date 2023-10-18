import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/bloc.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (p, c) => p.currentCity != c.currentCity,
      builder: (context, state) {
        if (state.isLoading) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
        }

        String descriptionFull() {
          if (state.currentCity == null ||
              state.currentCity?.name.isEmpty == true) {
            return 'Sua posição atual';
          }
          final city = state.currentCity!;
          return '${city.name}, ${city.state} - ${city.country}';
        }

        return Text(
          descriptionFull(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        );
      },
    );
  }
}

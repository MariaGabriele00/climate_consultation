import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../bloc/bloc.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (p, c) => p.weather.temp != c.weather.temp,
      builder: (context, state) {
        if (state.isLoading) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }

        return Text(
          '${state.weather.temp.tempRound()}°C',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        );
      },
    );
  }
}

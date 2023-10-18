import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../bloc/bloc.dart';

class MoreTemperatureWidget extends StatelessWidget {
  const MoreTemperatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LinearProgressIndicator();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TemperatureDetailWidget(
              title: 'Humidade',
              description: '${state.weather.humidity.tempRound()}%',
            ),
            Container(
              color: Colors.grey.shade300,
              width: 2,
              height: 20,
            ),
            _TemperatureDetailWidget(
              title: 'Tem. mínima',
              description: '${state.weather.minTemp.tempRound()}°C',
            ),
            Container(
              color: Colors.grey.shade300,
              width: 2,
              height: 20,
            ),
            _TemperatureDetailWidget(
              title: 'Tem. máxima',
              description: '${state.weather.maxTemp.tempRound()}°C',
            ),
          ],
        );
      },
    );
  }
}

class _TemperatureDetailWidget extends StatelessWidget {
  final String title;
  final String description;

  const _TemperatureDetailWidget({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title: ',
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: description,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

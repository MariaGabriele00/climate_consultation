import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/domain.dart';
import '../../../../main/factories/factories.dart';
import '../../../bloc/bloc.dart';
import 'widgets/widgets.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({super.key});

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  final cubit = weatherCubitFactory();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final city = ModalRoute.of(context)!.settings.arguments! as CityEntity;
      cubit.searchByLocation(city);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fazer uma nova consulta',
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
        child: const Icon(Icons.home),
      ),
      body: BlocProvider<WeatherCubit>.value(
        value: cubit,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LocationWidget(),
            TemperatureWidget(),
            MoreTemperatureWidget(),
          ],
        ),
      ),
    );
  }
}

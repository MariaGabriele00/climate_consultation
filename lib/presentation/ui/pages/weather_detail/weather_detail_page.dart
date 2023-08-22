import 'package:climate_consultation/domain/domain.dart';
import 'package:climate_consultation/main/factories/factories.dart';
import 'package:flutter/material.dart';

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
    return const Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }
}

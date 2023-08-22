import 'package:climate_consultation/presentation/ui/pages/weather_detail/weather_detail_page.dart';
import 'package:flutter/material.dart';

import '../presentation/presentation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta Clima',
      theme: ThemeData(
        useMaterial3: false,
        colorSchemeSeed: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListOfCitiesPage(),
        '/weather-detail': (context) => const WeatherDetailPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';

import '../presentation/presentation.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Party Weather',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListOfCitiesPage(),
        '/weather-detail': (context) => const WeatherDetailPage(),
      },
    );
  }
}

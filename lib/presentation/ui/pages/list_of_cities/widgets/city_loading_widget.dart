import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CityLoadingWidget extends StatelessWidget {
  const CityLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWaveSpinner(
        //carregamento animado
        size: 120,
        color: Color.fromARGB(255, 227, 255, 252),
      ),
    );
  }
}

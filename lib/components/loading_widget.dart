import 'package:climate_consultation/utilies/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: overlayColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitPouringHourGlassRefined(
              color: lightColor,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Buscando informações...',
              style: TextStyle(
                fontSize: 20,
                color: midLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

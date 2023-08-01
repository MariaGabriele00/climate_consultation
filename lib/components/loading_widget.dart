import 'package:climate_consultation/utilies/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/src/pulse.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitPulse(
              color: kLightColor,
              size: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Buscando dados...',
              style: TextStyle(
                fontSize: 20,
                color: kMidLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

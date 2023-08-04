import 'package:climate_consultation/utilies/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: overlayColor,
      body: Center(child: LayoutBuilder(
        builder: ((context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinKitPumpingHeart(
                color: Color.fromARGB(255, 145, 10, 10),
                size: 150,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.1,
              ),
              const Text(
                'Buscando informações...',
                style: TextStyle(
                  fontSize: 20,
                  color: midLightColor,
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}

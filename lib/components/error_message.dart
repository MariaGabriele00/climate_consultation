import 'package:climate_consultation/utilies/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ErrorMessage extends StatelessWidget {
  final String title, message;
  const ErrorMessage({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_sharp, size: 150),
                SizedBox(height: constraints.maxHeight * 0.1),
                Text(title, style: detailsTextStyle),
                SizedBox(height: constraints.maxHeight * 0.1),
                Text(message,
                    style: locationTextStyle, textAlign: TextAlign.center),
              ],
            );
          },
        ),
      ),
    );
  }
}

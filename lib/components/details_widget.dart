import 'package:climate_consultation/utilies/constants.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  final String title, value;
  const DetailsWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(value, style: detailsTextStyle),
        Text(title, style: detailsTitleTextStyle),
      ],
    );
  }
}

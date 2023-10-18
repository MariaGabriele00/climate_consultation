import 'package:flutter/material.dart';

class CityLoadingWidget extends StatelessWidget {
  const CityLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

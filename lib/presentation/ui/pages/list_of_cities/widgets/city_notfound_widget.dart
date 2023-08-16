import 'package:flutter/material.dart';

class CityNotFoundWidget extends StatelessWidget {
  final void Function() restartPage;

  const CityNotFoundWidget({
    super.key,
    required this.restartPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox.shrink(),
        Text(
          'Nenhuma cidade encontrada',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
          onPressed: restartPage,
          child: const Text('Consultar outra cidade'),
        ),
      ],
    );
  }
}

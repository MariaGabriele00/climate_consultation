import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String errorMessage;
  final void Function() restartPage;

  const FailureWidget({
    super.key,
    required this.errorMessage,
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
          errorMessage,
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

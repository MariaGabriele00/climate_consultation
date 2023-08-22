import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  final void Function(String) onChanged;
  final void Function() onPressed;

  const SearchFieldWidget({
    super.key,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.teal,
        border: const OutlineInputBorder(),
        hintText: 'Digite o nome da cidade',
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: onPressed,
          color: Colors.white,
        ),
      ),
    );
  }
}
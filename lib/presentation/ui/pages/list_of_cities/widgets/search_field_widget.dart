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
        fillColor: const Color.fromARGB(255, 103, 131, 128),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
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

import 'package:flutter/material.dart';

class SearchBarComponent extends StatelessWidget {
  final void Function(String) onSearchInputChanged;
  const SearchBarComponent({super.key, required this.onSearchInputChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 72.0,
      child: TextField(
        onChanged: onSearchInputChanged,
        decoration: const InputDecoration(
          labelText: 'Palabra',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

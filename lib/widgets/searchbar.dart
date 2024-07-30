import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController searchbarController;
  final Function(String) onSubmit;
  const Searchbar({
    super.key,
    required this.searchbarController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onSubmitted: onSubmit,
        controller: searchbarController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Search",
        ),
      ),
    );
  }
}

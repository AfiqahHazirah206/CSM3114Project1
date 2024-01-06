//Afiqah Hazirah Binti Osman S63609
//Allows users to filter announcements based on categories

import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  final List<String> categories;
  final void Function(String?) onCategorySelected; // Updated type

  FilterOptions({required this.categories, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text('Filter by Category'),
      value: null,
      onChanged: onCategorySelected,
      items: categories.map((category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
    );
  }
}

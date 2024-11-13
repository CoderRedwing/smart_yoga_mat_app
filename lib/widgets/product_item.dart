import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String description;

  ProductItem({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}

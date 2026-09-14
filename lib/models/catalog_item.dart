import 'package:flutter/material.dart';

class CatalogItem {
  const CatalogItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.icon,
    required this.color,
  });

  final int id;
  final String name;
  final String price;
  final String category;
  final String description;
  final IconData icon;
  final Color color;
}

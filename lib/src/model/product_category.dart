
import 'package:flutter/material.dart' show IconData;
import 'package:home/src/model/product.dart';

class ProductCategory {
  ProductType type;
  bool isSelected;
  IconData icon;

  ProductCategory({
    required this.type,
    this.isSelected = false,
    required this.icon,
  });
}

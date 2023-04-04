import 'package:flutter/material.dart';
import 'package:new_project/entitis/product.dart';

class Category {
  final String name, id, image;
  final List<Product> products;

  Category(this.name, this.id, this.image, this.products);
}

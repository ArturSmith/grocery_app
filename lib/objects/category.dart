import 'package:flutter/material.dart';
import 'package:new_project/objects/product.dart';

class Category {
  final String name, id, image;
  final Color color;
  final List<Product>? products;

  Category(this.name, this.id, this.image, this.color, this.products);
}

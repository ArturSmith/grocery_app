// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'package:new_project/entities/product.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final String name, id, image;
  final List<Product> products;

  Category(this.name, this.id, this.image, this.products);

  factory Category.formJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

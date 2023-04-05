import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  final String name, image, id;
  int price;
  bool isSeasonal;
  int? discount, count;

  Product(this.isSeasonal, this.name, this.image, this.id, this.price,
      this.discount, this.count);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

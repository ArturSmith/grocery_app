// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
    json['isSeasonal'] as bool,
    json['name'] as String,
    json['image'] as String,
    json['id'] as String,
    json['price'] as int,
    json['discount'] as int,
    json['count'] as int);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'id': instance.id,
      'price': instance.price,
      'discount': instance.discount,
      'count': instance.count,
      'isSeasonal': instance.isSeasonal
    };

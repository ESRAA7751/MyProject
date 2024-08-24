// To parse this JSON data, do
//
//     final catProguct = catProguctFromJson(jsonString);

import 'dart:convert';

import 'package:finalproject/provider/models/cart_model.dart';

CatProguct catProguctFromJson(String str) => CatProguct.fromJson(json.decode(str));

String catProguctToJson(CatProguct data) => json.encode(data.toJson());

class CatProguct {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  CatProguct({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory CatProguct.fromJson(Map<String, dynamic> json) => CatProguct(
    products: json["products"] == null
        ? []
        : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

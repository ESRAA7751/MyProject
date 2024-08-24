// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  final List<Product>? products;
  final int? total;
  final int? skip;
  final int? limit;

  Products({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? thumbnail;
  final Category? category;

  Product({
    this.id,
    this.title,
    this.price,
    this.thumbnail,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    thumbnail: json["thumbnail"],
    category: categoryValues.map[json["category"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "thumbnail": thumbnail,
    "category": categoryValues.reverse[category],
  };
}

enum Category {
  BEAUTY,
  FRAGRANCES,
  FURNITURE,
  GROCERIES
}

final categoryValues = EnumValues({
  "beauty": Category.BEAUTY,
  "fragrances": Category.FRAGRANCES,
  "furniture": Category.FURNITURE,
  "groceries": Category.GROCERIES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final carts = cartsFromJson(jsonString);

import 'dart:convert';

Carts cartsFromJson(String str) => Carts.fromJson(json.decode(str));

String cartsToJson(Carts data) => json.encode(data.toJson());

class Carts {
  final List<Cart>? carts;
  final int? total;
  final int? skip;
  final int? limit;

  Carts({
    this.carts,
    this.total,
    this.skip,
    this.limit,
  });

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
    carts: json["carts"] == null ? [] : List<Cart>.from(json["carts"]!.map((x) => Cart.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "carts": carts == null ? [] : List<dynamic>.from(carts!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Cart {
  final int? id;
  final List<Product>? products;
  final double? total;
  final double? discountedTotal;
  final int? userId;
  final int? totalProducts;
  final int? totalQuantity;

  Cart({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    userId: json["userId"],
    totalProducts: json["totalProducts"],
    totalQuantity: json["totalQuantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "discountedTotal": discountedTotal,
    "userId": userId,
    "totalProducts": totalProducts,
    "totalQuantity": totalQuantity,
  };
}

class Product {
  final int? id;
  final String? title;
  final double? price;
  final int? quantity;
  final double? total;
  final double? discountPercentage;
  final double? discountedTotal;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    quantity: json["quantity"],
    total: json["total"]?.toDouble(),
    discountPercentage: json["discountPercentage"]?.toDouble(),
    discountedTotal: json["discountedTotal"]?.toDouble(),
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "quantity": quantity,
    "total": total,
    "discountPercentage": discountPercentage,
    "discountedTotal": discountedTotal,
    "thumbnail": thumbnail,
  };
}

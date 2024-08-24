// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  final String? slug;
  final String? name;
  final String? url;

  Categories({
    this.slug,
    this.name,
    this.url,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    slug: json["slug"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "name": name,
    "url": url,
  };
}

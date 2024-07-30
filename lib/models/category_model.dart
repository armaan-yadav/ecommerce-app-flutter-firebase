import 'dart:convert';

class CategoryModel {
  final String name;
  final String id;
  final String imageUrl;

  CategoryModel({
    required this.name,
    required this.id,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        id: json["id"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
      };
}

CategoryModel productModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String productModelToJson(CategoryModel data) => json.encode(data.toJson());

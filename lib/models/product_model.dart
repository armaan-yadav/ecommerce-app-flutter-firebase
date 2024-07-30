import "dart:convert";

class ProductModel {
  final String name;
  final String price;
  final String id;
  final String imageUrl;
  final String description;
  final String stock;
  final String categoryId;

  ProductModel({
    required this.categoryId,
    required this.name,
    required this.price,
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        stock: "mm",
        description: json["description"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "price": price,
        "name": name,
        "stock": stock,
        "description": description,
        "categoryId": categoryId,
      };
}

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

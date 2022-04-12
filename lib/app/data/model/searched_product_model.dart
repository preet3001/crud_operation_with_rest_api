// To parse this JSON data, do
//
//     final searchedProductModel = searchedProductModelFromJson(jsonString);

import 'dart:convert';

List<SearchedProductModel> searchedProductModelFromJson(String str) => List<SearchedProductModel>.from(json.decode(str).map((x) => SearchedProductModel.fromJson(x)));

String searchedProductModelToJson(List<SearchedProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchedProductModel {
    SearchedProductModel({
        required this.productId,
        required this.shopId,
        required this.categoryId,
        required this.name,
        required this.image,
        required this.status,
    });

    String productId;
    String shopId;
    String categoryId;
    String name;
    String image;
    String status;

    factory SearchedProductModel.fromJson(Map<String, dynamic> json) => SearchedProductModel(
        productId: json["product_id"],
        shopId: json["shop_id"],
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "shop_id": shopId,
        "category_id": categoryId,
        "name": name,
        "image": image,
        "status": status,
    };
}


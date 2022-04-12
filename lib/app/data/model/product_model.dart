// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    ProductModel({
        required this.prodId,
        required this.prodName,
        required this.prodPrice,
        required this.prodQty,
        required this.prodDesc,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    String prodId;
    String prodName;
    String prodPrice;
    String prodQty;
    String prodDesc;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        prodId: json["prod_id"],
        prodName: json["prod_name"],
        prodPrice: json["prod_price"],
        prodQty: json["prod_qty"],
        prodDesc: json["prod_desc"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "prod_id": prodId,
        "prod_name": prodName,
        "prod_price": prodPrice,
        "prod_qty": prodQty,
        "prod_desc": prodDesc,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

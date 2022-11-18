import 'dart:convert';
import 'dart:developer';

import 'package:crud_operation/app/common_widgets/common_loader/common_loader.dart';
import 'package:crud_operation/app/data/model/product_model.dart';
import 'package:crud_operation/app/data/model/searched_product_model.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  Dio client;
  ProductRepository({
    required this.client,
  });

  Future<List<ProductModel>> getProductList() async {
    try {
      Response r = await client.get("/products");
      if (r.statusCode == 200) {
        return productModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error("msg");
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<List<SearchedProductModel>> findProductByName(
      {required String name}) async {
    var data = FormData.fromMap({"name": name});
    try {
      Response r = await client.post("/Api/getProductByName", data: data);
      if (r.statusCode == 200) {
        return searchedProductModelFromJson(jsonEncode(r.data["data"] ?? []));
      } else {
        return Future.error("msg");
      }
    } on DioError catch (e) {
      log(e.response!.data);
      return Future.error(e.message);
    }
  }

  createProduct(
      {required String prodName,
      required String prodPrice,
      required String prodQty,
      required String prodDesc,
      required String imagePath}) async {
    CommonLoader.showLoading();
    var data = {
      "title": prodName,
      "price": prodPrice,
      "description": prodDesc,
      "image": "https://i.pravatar.cc",
      "category": "electronic",
    };
    try {
      Response r = await client.post("/products", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        CommonLoader.showSuccessDialog(
            description: "Product Created Sucessfully");
      } else {
        CommonLoader.showErrorDialog(description: r.data["errors"]);
      }
    } on DioError catch (e) {
      log(e.response.toString());
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}

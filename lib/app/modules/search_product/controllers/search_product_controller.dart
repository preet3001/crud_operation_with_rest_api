import 'package:crud_operation/app/data/model/product_model.dart';
import 'package:crud_operation/app/data/model/searched_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api_provider/client.dart';
import '../../../data/api_provider/repositories/product_repository.dart';

class SearchProductController extends GetxController with StateMixin<List<SearchedProductModel>>{
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
  
  
  callSearchProductApi()async{
    change(null,status: RxStatus.loading());
    Client client = Client();
    ProductRepository productRepository=ProductRepository(client: client.init());
    try {
      productRepository.findProductByName(name: search.text).then((value) {
        if(value.isEmpty){
          change(null,status: RxStatus.empty());
        } else{
          change(value,status: RxStatus.success());
        }
      },onError: (err){
        change(value,status: RxStatus.error(err.toString()));
      });
    } on Exception catch (e) {
      change(value,status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    callSearchProductApi();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    key.currentState!.dispose();
    super.dispose();
  }
}


import 'dart:io';

import 'package:crud_operation/app/data/api_provider/client.dart';
import 'package:crud_operation/app/data/api_provider/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController description = TextEditingController();
  Rx<File> image= File("").obs;

  RxBool isSubmitTapped = false.obs;


  pickImage ()async{
    ImagePicker picker = ImagePicker();
    var temp = await picker.pickImage(source: ImageSource.gallery);
    if(temp != null){
      image.value = File(temp.path);
    }
  }

  callCreateProductApi()async{
    Client client = Client();
    ProductRepository productRepository = ProductRepository(client: client.init());
    productRepository.createProduct(prodName: name.text, prodPrice: price.text, prodQty: quantity.text, prodDesc: description.text, imagePath: image.value.path);
  }


  @override
  void dispose() {
    name.dispose();
    price.dispose();
    quantity.dispose();
    description.dispose();
    key.currentState!.dispose();
    super.dispose();
  }
}

import 'package:crud_operation/app/constants/app_colors.dart';
import 'package:crud_operation/app/constants/app_string.dart';
import 'package:crud_operation/app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(createProduct),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Form(
          key: controller.key,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                // InkWell(
                //   onTap: (){
                //     controller.pickImage();
                //   },
                //   child: Obx(
                //     ()=> controller.image.value.path ==""?Column(
                //       children: [
                //         Icon(Icons.image_search,size: 40.sp,color: grey400,),
                //         Text(tapToSelectImage,style:controller.image.value.path ==""&&controller.isSubmitTapped.value?red12Style: grey12Style,),
                //       ],
                //     ):Image.file(controller.image.value,width: 35.w,),
                //   ),
                // ),
                TextFormField(
                  controller: controller.name,
                  validator: (val){
                    if (val=="") {
                      return enterName;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: name,
                  ),
                ),
                TextFormField(
                  controller: controller.price,
                  keyboardType: TextInputType.number,
                  validator: (val){
                    if (val=="") {
                      return enterPrice;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: price,
                  ),
                ),
                TextFormField(
                  controller: controller.quantity,
                  keyboardType: TextInputType.number,
                  validator: (val){
                    if (val=="") {
                      return enterQuantity;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: quantity,
                  ),
                ),
                TextFormField(
                  controller: controller.description,
                  validator: (val){
                    if (val=="") {
                      return enterDescription;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: description,
                  ),
                ),
          
                ElevatedButton(onPressed: (){
                  controller.isSubmitTapped.value = true;
                  if(controller.key.currentState!.validate()){
                    controller.callCreateProductApi();
                  }
                }, child: Text(createProduct))
              ],
            ),
          ),
        ),
      )
    );
  }
}

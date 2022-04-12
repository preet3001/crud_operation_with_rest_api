import 'package:crud_operation/app/common_widgets/tiles/searched_product_tile.dart';
import 'package:crud_operation/app/constants/app_colors.dart';
import 'package:crud_operation/app/constants/app_string.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/tiles/product_tile.dart';
import '../../../constants/app_text_styles.dart';
import '../controllers/search_product_controller.dart';

class SearchProductView extends GetView<SearchProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controller.search,
          onEditingComplete: (){
            controller.callSearchProductApi();
          },
          onFieldSubmitted: (val){
            controller.callSearchProductApi();            
          },
          validator: (val) {
            if (val == "") {
              return searchProducts;
            }
          },
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              controller.callSearchProductApi();
            },
            child: Icon(Icons.search,color: white,size: 25.sp,))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.callSearchProductApi();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(pullToRefresh,style: grey12Style,),
              controller.obx(
                (state) => ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state!.length,
                  itemBuilder: ((context, index) => SearchedProductTile(productModel: state[index],)),
                ),
                onEmpty: Center(child: Text(noData,style: grey15Style,),),
                onError: (err)=>Center(child: Text(err??noData,style: grey15Style,),)
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}

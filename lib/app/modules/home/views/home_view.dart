import 'package:crud_operation/app/common_widgets/tiles/product_tile.dart';
import 'package:crud_operation/app/constants/app_colors.dart';
import 'package:crud_operation/app/constants/app_string.dart';
import 'package:crud_operation/app/constants/app_text_styles.dart';
import 'package:crud_operation/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(products),
        actions: [
          InkWell(
            onTap: (){
              Get.toNamed(Routes.SEARCH_PRODUCT);
            },
            child: Icon(Icons.search,size: 20.sp,color: white,)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: InkWell(
              onTap: (){
                Get.toNamed(Routes.CREATE_PRODUCT);
              },
              child: Icon(Icons.add,size: 23.sp,color: white,)),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.callGetProductApi();
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
                  itemBuilder: ((context, index) => ProductTile(productModel: state[index],)),
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

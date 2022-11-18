import 'package:crud_operation/app/constants/app_string.dart';
import 'package:crud_operation/app/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:crud_operation/app/constants/app_colors.dart';
import 'package:crud_operation/app/data/model/product_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 5.w),
      child: PhysicalModel(
        color: white,
        borderRadius: BorderRadius.circular(6.sp),
        elevation: 3,
        child: Padding(
          padding:  EdgeInsets.all(8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name +": "+productModel.title,style: black15Style,),
              Text(price +": "+productModel.price.toString(),style: black15Style,),
              Text(quantity +": "+1.toString(),style: black15Style,),
              Text(description +": "+productModel.description,style: black15Style,),
            ],
          ),
        )
      ),
    );
  }
}

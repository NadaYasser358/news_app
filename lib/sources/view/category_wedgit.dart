import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/common/theme.dart';
import 'package:news/sources/data/category_model.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key,required this.index,required this.categoryModel});
  final CategoryModel categoryModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
            bottomLeft: index.isEven?Radius.circular(25.r):Radius.circular(0.r),
          bottomRight: index.isOdd?Radius.circular(25.r):Radius.circular(0.r),

        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage(categoryModel.image),width: 121.w,height: 105.h,),
          Text(categoryModel.title,style: Style.categoryText,)
        ],
      ),
    );
  }
}

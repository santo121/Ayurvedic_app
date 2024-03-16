//*---------------------------------------------------------------- (Common_Button)
  import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../config/color.config.dart';
class UiConstants{

ElevatedButton commonButton({
    Color backgroundColor = kBlack,
    required void Function()? onPressed,
    required String text,
    double? width,
    double? price,
    bool isSearchButton = false,
    bool apiLoader = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(width ?? size.width, 55.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child:apiLoader?const Padding(
        padding:  EdgeInsets.all(5.0),
        child:  CircularProgressIndicator(color: kWhite,),
      ): isSearchButton? kStyles.med14(
              text: text,
              color: kWhite,
            ):kStyles.med18(
              text: text,
              color: kWhite,
            ),
    );
  }
}

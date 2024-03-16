import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../global/constants/asset.const.dart';

class EnrollHeader extends StatelessWidget {
  const EnrollHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(splashBackGroundImgHorizontal),
              fit: BoxFit.cover,
            ),
          ),
          // child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          //   child: Container(
          //     decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          //   ),
          // ),
        ),
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color:const Color(0x43002F03).withOpacity(0.0)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 167.w),
                child: SvgPicture.asset(
                  appLogo,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

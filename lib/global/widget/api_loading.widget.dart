import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../config/color.config.dart';
import '../constants/asset.const.dart';

class APILoader extends StatelessWidget {
  const APILoader({
    super.key,
    required this.loader,
    required this.child,
  });
  final bool loader;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        loader
            ? Center(
                child: Container(
                  width: 140,
                  height: 80,
                  decoration: BoxDecoration(
                      color: kTrans, borderRadius: BorderRadius.circular(10.r)),
                  child: Center(
                    child: Lottie.asset(
                      apiLoadingLottie,
                      repeat: true,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
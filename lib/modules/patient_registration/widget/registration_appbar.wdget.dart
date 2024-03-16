import 'package:ayurvedic_app/global/config/color.config.dart';
import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../global/constants/asset.const.dart';

class PatientRegistrationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PatientRegistrationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kBlack,width: 0.25)
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(44.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);

                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: kBlack,
                      size: 28.r,
                    )),
                IconButton(
                    onPressed: () {
                    },
                    icon: SvgPicture.asset(
                      notIcon,
                    )),
              ],
            ),
                const Gap(20),

         Padding(
           padding:  EdgeInsets.symmetric(horizontal: 10.w),
           child: kStyles.semiBold26(text: 'Register'),
         )
         ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(size.width, 154);
}



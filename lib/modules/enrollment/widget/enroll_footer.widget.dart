import 'package:ayurvedic_app/global/config/color.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EnrollFooter extends StatefulWidget {
  const EnrollFooter({super.key});

  @override
  State<EnrollFooter> createState() => _EnrollFooterState();
}

class _EnrollFooterState extends State<EnrollFooter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
                  Gap(85.h),

          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  'By creating or logging into an account you are agreeing with our',
              style: GoogleFonts.getFont('Poppins',
              color: fontColor,
                  fontSize: 13.sp, fontWeight: FontWeight.w400),
              children: <TextSpan>[
                TextSpan(
                    text: ' Terms and Conditions',
                    style: GoogleFonts.getFont('Poppins',color:const Color(0xFF0028FC),
                        fontSize: 13.sp, fontWeight: FontWeight.w500)),
                TextSpan(
                    text: ' and',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 13.sp, fontWeight: FontWeight.w400)),
                TextSpan(
                    text: ' Privacy Policy',
                    style: GoogleFonts.getFont('Poppins',color:const Color(0xFF0028FC),
                        fontSize: 13.sp, fontWeight: FontWeight.w500)),
                TextSpan(
                    text: '.',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 13.sp, fontWeight: FontWeight.w400)),
             
              ],
            ),
          ),
          Gap(10.h)
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:ayurvedic_app/global/config/db.config.dart';
import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:ayurvedic_app/modules/Patient_list/view/patient_list.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../global/constants/asset.const.dart';
import '../../../global/interceptor/network.interceptor.dart';
import '../../enrollment/view/enrollment.view.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      // SystemUiOverlay.bottom
    ]);
    Timer(const Duration(seconds: 3), () {
     
      if( userInfo.get(DbKey().tokenKey)==null || userInfo.get(DbKey().tokenKey)!.isEmpty){
                Navigator.of(context)
            .pushNamedAndRemoveUntil(EnrollmentScreen.route, (route) => false);
      }else{
          Navigator.of(context)
            .pushNamedAndRemoveUntil(PatientListScreen.route, (route) => false);
      }

      });
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          splashBackGroundImg,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
                color: const Color(0x60021400),
                height: size.height,
                width: size.width,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 128.w),
                    child: SvgPicture.asset(
                      appLogo,
                    ),
                  ),
                )))
      ],
    );
  }
}

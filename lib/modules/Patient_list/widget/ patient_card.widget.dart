import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/asset.const.dart';

class PatientCardWidget extends StatelessWidget {
  const PatientCardWidget({super.key, required this.index, required this.name, required this.desc, required this.secondName, required this.date});
final int index;
final String name;
final String desc;
final String secondName;
final DateTime date;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),

      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(10.r) ,
        color: patientCardColor
      ),
        child: Column(
          children: [
                              const Gap(15),

            Padding(
              padding:    EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Expanded(
                    flex: 1,
                    child:kStyles.med18(text:"${index.toString()}.")),
                  Expanded(
                    flex: 8,
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kStyles.med18(text: name),
                        kStyles.light16(text: desc,color: kGreen),
                              const Gap(15),
              
                        Row(children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SvgPicture.asset(calender),
                              const Gap(5),
                              kStyles.reg15(text: DateFormat('dd/MM/yyy').format(date)),
                            ],
                          ),
                              const Gap(30),
              
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               SvgPicture.asset(accountIcon),
                              const Gap(5),
                              kStyles.reg15(text: secondName),
                            ],
                          ),
              
                         
                        ],)
                      ],
                      
                      
                      )),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child:kStyles.med18(text:"")),
                   Expanded(
                    flex: 8,child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        kStyles.reg16(text: 'View Booking details'),
                        const Icon(Icons.arrow_forward_ios_sharp,color: kGreen,)
                      ],
                    )),
                ],
              ),
            )
          ],
        ),
    );
  }
}
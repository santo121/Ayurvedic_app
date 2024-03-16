import 'package:ayurvedic_app/global/config/color.config.dart';
import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:ayurvedic_app/global/widget/text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../global/constants/asset.const.dart';

class PatientListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PatientListAppBar({super.key});

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
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: kBlack,
                      size: 28.r,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      notIcon,
                    )),
              ],
            ),
                const Gap(20),

            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: SearchField(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search for treatments',
                    validator: (String? val) {
                      return null;
                    },
                    controller: TextEditingController(),
                  ),
                ),
                const Gap(10),
                Expanded(
                  flex: 3,child: uiCon.commonButton(
                    backgroundColor: kGreen,
                    onPressed: (){}, text: 'Search',isSearchButton: true))
              ],
            ),
                const Gap(20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                kStyles.reg16(text: 'Sort by :'),
                const DropDownList(),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(size.width, 242);
}



const List<String> list = <String>['Date'];
class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 208.w,
          padding:const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
                color: kBlack, style: BorderStyle.solid, width: 0.25),
          ),
            child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: list
                .map((value) => DropdownMenuItem(
                      value: value,
                      child: kStyles.reg15(text: value),
                    ))
                .toList(),
            onChanged: ( value) {},
            isExpanded: false,
            value: list.first,
          ),
        ),
      ));
  }
}
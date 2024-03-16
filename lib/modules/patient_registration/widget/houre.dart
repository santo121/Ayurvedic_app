import 'package:ayurvedic_app/modules/patient_registration/controller/patient_registration.controller.dart';
import 'package:ayurvedic_app/modules/patient_registration/model/patient_branch.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/dimensions.config.dart';
import '../../../global/constants/global.const.dart';

const List<String> list = <String>['loading---'];

class RegistrationDropDownListTime extends StatefulWidget {
  const RegistrationDropDownListTime({super.key, required this.label});
  final String label;
  @override
  State<RegistrationDropDownListTime> createState() =>
      _RegistrationDropDownListTimeState();
}

class _RegistrationDropDownListTimeState extends State<RegistrationDropDownListTime> {
  String dropdownValue = list.first;
  Branches? data;
   int selectedHour = 0;
   List<String> generateHourList() {
  List<String> hours = [];
  for (int i = 0; i < 24; i++) {
    final hour = i % 12 == 0 ? 12 : i % 12;
    final period = i < 12 ? 'AM' : 'PM';
    hours.add('$hour:00 $period');
  }
  return hours;
}
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl =
          Provider.of<PatientRegisterController>(context, listen: false);
      dropdownValue = ctrl.branchList.branches?.first.name ?? 'select branch';
      data = ctrl.branchList.branches?.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientRegisterController>(builder: (context, ctrl, _) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //!---Label Text
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: kStyles.reg16(text: widget.label),
          ),

          KDimensions().sHeight(ht: size.height * 0.006),
          Container(
            height: 60,
          
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: formFillColor,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: kBlack, style: BorderStyle.solid, width: 0.25),
            ),
            child: ctrl.branchList.branches == null
                ? const SizedBox()
                : Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            value: selectedHour,
            onChanged: (newValue) {
              setState(() {
                selectedHour = newValue!;
              });
            },
            items: List.generate(24, (index) {
              final hour = index % 12 == 0 ? 12 : index % 12;
              final period = index < 12 ? 'AM' : 'PM';
              return DropdownMenuItem<int>(
                value: index,
                child: kStyles.light14(text: '$hour:00 $period'),
              );
            }),
          ),
        ),
      ),
          ),
        ],
      ));
    });
  }
}

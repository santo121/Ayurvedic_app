import 'package:ayurvedic_app/modules/patient_registration/controller/patient_registration.controller.dart';
import 'package:ayurvedic_app/modules/patient_registration/model/patient_branch.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/dimensions.config.dart';
import '../../../global/constants/global.const.dart';

const List<String> list = <String>['loading---'];

class RegistrationDropDownList extends StatefulWidget {
  const RegistrationDropDownList({super.key, required this.label});
  final String label;
  @override
  State<RegistrationDropDownList> createState() =>
      _RegistrationDropDownListState();
}

class _RegistrationDropDownListState extends State<RegistrationDropDownList> {
  String dropdownValue = list.first;
  Branches? data;
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
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: formFillColor,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: kBlack, style: BorderStyle.solid, width: 0.25),
            ),
            child: ctrl.branchList.branches == null
                ? const SizedBox()
                : DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: ctrl.branchList.branches!
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: kStyles.reg15(text: value.name ?? ''),
                              ))
                          .toList(),
                      onChanged: (value) {
                        ctrl.setBranchName(value?.name ?? '',(value?.id??0).toString());
                        setState(() {
                          data = value;
                        });
                      },
                      isExpanded: false,
                      value: data,
                    ),
                  ),
          ),
        ],
      ));
    });
  }
}

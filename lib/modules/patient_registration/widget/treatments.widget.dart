import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:ayurvedic_app/modules/patient_registration/controller/patient_registration.controller.dart';
import 'package:ayurvedic_app/modules/patient_registration/widget/add_patient_card.widget.dart';
import 'package:ayurvedic_app/modules/patient_registration/widget/treatment.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/asset.const.dart';

class TreatMentWidget extends StatelessWidget {
  const TreatMentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<PatientRegisterController>(
          builder: (context,ctrl,_) {
            return Column(
              children:
              List.generate(ctrl.treatmentList.length, (index) =>  Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: formFillColor, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: kStyles.med18(text: '${index+1}.')),
                      Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kStyles.med18(text:ctrl.treatmentList[index].treatment),
                              const Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      kStyles.reg16(text: 'Male', color: kGreen),
                                      const Gap(10),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border:
                                                Border.all(width: .25, color: kBlack)),
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 20),
                                        child: kStyles.reg16(text: ctrl.treatmentList[index].mailCount, color: kGreen),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      kStyles.reg16(text: 'Female', color: kGreen),
                                      const Gap(10),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border:
                                                Border.all(width: .25, color: kBlack)),
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 20),
                                        child: kStyles.reg16(text: ctrl.treatmentList[index].femaleCount, color: kGreen),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {ctrl.removeAddedTreatment(index);}, icon: SvgPicture.asset(closeIcon)),
                            IconButton(onPressed: () {}, icon: SvgPicture.asset(edit))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
               
            );
          }
        ),
        const Gap(10),
        uiCon.commonButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (ctx) =>
                      StatefulBuilder(builder: (context, setState) {
                        return const AlertDialog(
                          backgroundColor: kWhite,
                          insetPadding:  EdgeInsets.symmetric(
                              horizontal: 40, vertical: 200),
                          shape:  RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                      
                          content: AlertWidget(),
                        );
                      }));
            },
            text: '+ Add Treatments',
            backgroundColor: kGreen)
      ],
    );
  }
}

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      child:  Column(children: [
       const RegistrationDropDownListTreatment(
          label: 'Choose Treatment',
          
        ),
       const  Gap(22),
      const  AddPatientWidgetCard(),
       const  Gap(22),

        Consumer<PatientRegisterController>(
          builder: (context,ctrl,_) {
            return uiCon.commonButton(onPressed: (){
              ctrl.addTreatment(TreatMentModel(mailCount:ctrl.maleCount.toString(),femaleCount:ctrl.femaleCount.toString(),selectedId:ctrl.treatmentId.toString(), treatment:ctrl.treatments.text   ));
            }, text: 'Save',backgroundColor: kGreen);
          }
        )
      ]),
    );
  }
}

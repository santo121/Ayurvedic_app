import 'package:ayurvedic_app/modules/patient_registration/controller/patient_registration.controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/global.const.dart';

class AddPatientWidgetCard extends StatelessWidget {
  const AddPatientWidgetCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 114,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: .25, color: kBlack)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(child: Row(
                children: [
                  kStyles.reg16(text: 'Male', color: kGreen),
                  //------  --- --- --- --- --- --- ---
                
                ],
              )),
            ),

                  Consumer<PatientRegisterController>(
                    builder: (context,ctrl,_) {
                      return Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: kGreen
                            ),
                            onPressed: (){
                              ctrl.minusMailCount();
                            }, icon:const Icon(Icons.remove,color: kWhite,)),
                            Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: .25, color: kBlack)),
                                 
                                        child: Center(child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                          kStyles.reg16(text: ctrl.maleCount.toString(), color: kGreen),
                          //------  --- --- --- --- --- --- ---
                                          
                                          ],
                                        )),
                                      ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: kGreen
                            ),
                            onPressed: (){
                               ctrl.addMailCount();
                            }, icon:const Icon(Icons.add,color: kWhite,)),
                        ],
                      );
                    }
                  )

          ],
        ),
        const Gap(22),
        Consumer<PatientRegisterController>(
                    builder: (context,ctrl,_) {
            return Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 114,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: .25, color: kBlack)),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(child: Row(
                    children: [
                      kStyles.reg16(text: 'Female', color: kGreen),
                    ],
                  )),
                ),
            
            
                Row(
                  children: [
                    IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: kGreen
                            ),
                            onPressed: (){
                              ctrl.minusFemaleCount();
                            }, icon:const Icon(Icons.remove,color: kWhite,)),
                            Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: .25, color: kBlack)),
                
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          kStyles.reg16(text: (ctrl.femaleCount).toString(), color: kGreen),
                          //------  --- --- --- --- --- --- ---
                        
                        ],
                      )),
                    ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: kGreen
                            ),
                            onPressed: (){ctrl.addFemaleCount();}
                            , icon:const Icon(Icons.add,color: kWhite,)),
                  ],
                )
              
              
              
              ],
            );
          }
        )
      ],
    );
  }
}



import 'package:ayurvedic_app/global/constants/global.const.dart';
import 'package:ayurvedic_app/modules/patient_registration/controller/patient_registration.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/constants/dimensions.config.dart';

enum SingingCharacter { cash, card, upi}

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  SingingCharacter? _character = SingingCharacter.cash;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<PatientRegisterController>(
        builder: (context,ctrl,_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children:[
              Padding(
              padding: const EdgeInsets.only(left: 10),
              child: kStyles.reg16(text: 'Payment Option'),
            ),
          
            KDimensions().sHeight(ht: size.height * 0.006),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      
                      children: [
                        Radio<SingingCharacter>(
                            value: SingingCharacter.cash,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                              ctrl.setPaymentOption('Cash');
                            },
                          ),
                        kStyles.reg16(text:'Cash'),
                
                      ],
                    ),
                   Row(
                     children: [
                
                       Radio<SingingCharacter>(
                            value: SingingCharacter.card,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                              ctrl.setPaymentOption('Card');

                            },
                          ),
                        kStyles.reg16(text:'Card'),
                        
                
                     ],
                   ),
                   Row(
                     children: [
                       Radio<SingingCharacter>(
                            value: SingingCharacter.upi,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                              ctrl.setPaymentOption('UPI');

                            },
                          ),
                      kStyles.reg16(text:'UPI'),
                
                     ],
                   ),
                  ],
                ),
              ),
            ]
          );
        }
      ),
    );
  }
}

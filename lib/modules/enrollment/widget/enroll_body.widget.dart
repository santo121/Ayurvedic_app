import 'package:ayurvedic_app/modules/Patient_list/view/patient_list.view.dart';
import 'package:ayurvedic_app/modules/enrollment/controller/enrollment.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/global.const.dart';
import '../../../global/constants/validations.const.dart';
import '../../../global/dependency_injection/di.dart';
import '../../../global/widget/text_field.widget.dart';

class EnrollBody extends StatelessWidget {
  EnrollBody({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child:
          Consumer<EnrollmentController>(builder: (context, enrollmentCtrl, _) {

            
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Gap(30.h),
                  kStyles.semiBold24(
                      text: "Login or register to book your appointments",
                      color: fontColor),
                  Gap(30.h),

                  //!---Email
                  CommonTextFieldWidget(
                      fillColor: formFillColor,
                      label: 'Email',
                      validator: (String? value) =>
                          getIt<TextFieldValidation>().nameValidation(value),
                      keyboardType: TextInputType.emailAddress,
                      controller: enrollmentCtrl.emailController,
                      hintText: 'Enter your email',
                      textCapitalization: TextCapitalization.words),
                  //!---Password
                  Gap(25.h),

                  CommonTextFieldWidget(
                      fillColor: formFillColor,
                      label: 'Password',
                      validator: (String? value) =>
                          getIt<TextFieldValidation>().nameValidation(value),
                      keyboardType: TextInputType.name,
                      controller: enrollmentCtrl.passWord,
                      hintText: 'Enter Password',
                      textCapitalization: TextCapitalization.words),
                ],
              ),
              Gap(85.h),
              Consumer<EnrollmentController>(builder: (context, enCtrl, _) {
                return uiCon.commonButton(
                    apiLoader: enCtrl.apiLoader,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (await enCtrl.callLoginService()) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              PatientListScreen.route, (route) => false);
                        }
                      }
                    },
                    text: 'Login',
                    backgroundColor: kGreen);
              })
            ],
          ),
        );
     
     
      }),
    );
  }
}

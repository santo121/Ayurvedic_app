import 'package:ayurvedic_app/modules/patient_registration/widget/radio.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/global.const.dart';
import '../../../global/constants/validations.const.dart';
import '../../../global/dependency_injection/di.dart';
import '../../../global/widget/text_field.widget.dart';
import '../controller/patient_registration.controller.dart';
import '../widget/dropdowns.widget.dart';
import '../widget/houre.dart';
import '../widget/registration_appbar.wdget.dart';
import '../widget/treatments.widget.dart';

class PatientRegistrationView extends StatefulWidget {
  const PatientRegistrationView({super.key});
  static const route = '/patientRegistrationView';
  @override
  State<PatientRegistrationView> createState() =>
      _PatientRegistrationViewState();
}

final _formKey = GlobalKey<FormState>();

class _PatientRegistrationViewState extends State<PatientRegistrationView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl =
          Provider.of<PatientRegisterController>(context, listen: false);
      ctrl.getBranches();
      ctrl.getTreatmentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PatientRegistrationAppBar(),
      body: Form(
        key: _formKey,
        child: Consumer<PatientRegisterController>(builder: (context, ctrl, _) {
          return ctrl.branchList.branches == null &&
                  ctrl.treatmentListModel.treatments == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Gap(30.h),

                        //!---Email
                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Name',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.name,
                            controller: ctrl.name,
                            hintText: 'Enter your name',
                            textCapitalization: TextCapitalization.words),
                        Gap(20.h),
                        //!---Email
                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Whatsapp Number',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .phoneValidation(value,10,9),
                            keyboardType: TextInputType.number,
                            controller: ctrl.phone,
                            hintText: 'Enter your whatsapp number',
                            textCapitalization: TextCapitalization.words),
                        //!---Email
                        Gap(20.h),

                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Address',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.emailAddress,
                            controller: ctrl.address,
                            hintText: 'Enter your address',
                            textCapitalization: TextCapitalization.words),
                        //!---Email
                        Gap(20.h),
                        const RegistrationDropDownList(
                          label: 'Branch',
                        ),
                        Gap(20.h),
                        const TreatMentWidget(),
                        Gap(20.h),

                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Total Amount',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.number,
                            controller: ctrl.totalAmount,
                            hintText: '',
                            textCapitalization: TextCapitalization.words),
                        //!---Email
                        Gap(20.h),
                        const PaymentOption(),
                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Discount Amount',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.number,
                            controller: ctrl.discountAmount,
                            hintText: '',
                            textCapitalization: TextCapitalization.words),
                        //!---Email
                        Gap(20.h),

                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Advance Amount',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.number,
                            controller: ctrl.advanceAmount,
                            hintText: '',
                            textCapitalization: TextCapitalization.words),
                        //!---Email
                        Gap(20.h),

                        CommonTextFieldWidget(
                            fillColor: formFillColor,
                            label: 'Balance Amount',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.number,
                            controller: ctrl.balanceAmount,
                            hintText: '',
                            textCapitalization: TextCapitalization.words),
                        Gap(20.h),
                        CommonTextFieldWidget(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 200, horizontal: 40),
                                  child: SfDateRangePicker(
                                    controller: ctrl.controller,
                                    onSelectionChanged: (val) {
                                      ctrl.selectedDate(val.value);
                                    },
                                  ),
                                ),
                              );
                            },
                            suffixIcon: const Icon(
                              Icons.calendar_today_outlined,
                              color: kGreen,
                            ),
                            fillColor: formFillColor,
                            label: 'Treatment Date',
                            validator: (String? value) =>
                                getIt<TextFieldValidation>()
                                    .nameValidation(value),
                            keyboardType: TextInputType.none,
                            controller: ctrl.date_nd_time,
                            hintText:
                                (ctrl.controller?.selectedDate?.day ?? '-')
                                    .toString(),
                            textCapitalization: TextCapitalization.words),
                        Gap(20.h),

                        const Row(
                          children: [
                            Expanded(
                                child: RegistrationDropDownListTime(
                              label: 'Treatment Time',
                            )),
                          ],
                        ),
                        Gap(20.h),
uiCon.commonButton(onPressed: (){
  if(_formKey.currentState!.validate()){
    ctrl.callNewApiService();
  }
}, text: 'Save',backgroundColor: kGreen),
                        Gap(20.h),

                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

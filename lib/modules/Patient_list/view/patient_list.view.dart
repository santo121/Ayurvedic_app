import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/config/color.config.dart';
import '../../../global/constants/global.const.dart';
import '../../patient_registration/view/patient_registration.view.dart';
import '../controller/patients_list.controller.dart';
import '../widget/ patient_card.widget.dart';
import '../widget/patient_app_bar.widget.dart';

class PatientListScreen extends StatefulWidget {
  static const String route = '/patientList';
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl = Provider.of<PatientsListController>(context, listen: false);
      ctrl.getPatentsList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PatientListAppBar(),
      body: Consumer<PatientsListController>(builder: (context, ctrl, _) {
        return ctrl.patientList.patient != null
            ? Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {
                      await ctrl.getPatentsList();
                    },
                    child: ListView.builder(
                        itemCount: ctrl.patientList.patient?.length ?? 0,
                        itemBuilder: (context, int index) {
                          final snap = ctrl.patientList.patient?[index];
                          return PatientCardWidget(
                            date: snap?.dateNdTime != null
                                ? DateTime.parse((snap?.dateNdTime).toString())
                                : DateTime.now(),
                            desc:
                                snap?.patientdetailsSet?[0].treatmentName ?? '',
                            name: snap?.name ?? '',
                            index: index + 1,
                            secondName: snap?.branch?.name ?? '',
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: uiCon.commonButton(
                        onPressed: () async {
                          Navigator.of(context).pushNamed(
                            PatientRegistrationView.route,
                          );
                        },
                        text: 'Register Now',
                        backgroundColor: kGreen),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

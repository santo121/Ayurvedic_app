import 'package:ayurvedic_app/modules/Patient_list/view/patient_list.view.dart';
import 'package:flutter/material.dart';

import '../../modules/enrollment/view/enrollment.view.dart';
import '../../modules/patient_registration/view/patient_registration.view.dart';
import '../../modules/splash/view/splash_main.view.dart';

Map<String, Widget Function(BuildContext)> routes = {
   '/': (BuildContext context) => const SplashScreen(),
   '/enroll': (BuildContext context) => const EnrollmentScreen(),
   '/patientList': (BuildContext context) => const PatientListScreen(),
   '/patientRegistrationView': (BuildContext context) => const PatientRegistrationView(),
};
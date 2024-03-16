import 'package:ayurvedic_app/modules/enrollment/controller/enrollment.controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../modules/Patient_list/controller/patients_list.controller.dart';
import '../../modules/patient_registration/controller/patient_registration.controller.dart';
import '../../modules/splash/controller/splash.controller.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => SplashController()),
  ChangeNotifierProvider(create: (context) => EnrollmentController()),
  ChangeNotifierProvider(create: (context) => PatientsListController()),
  ChangeNotifierProvider(create: (context) => PatientRegisterController()),
];

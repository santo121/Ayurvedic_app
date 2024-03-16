import 'package:ayurvedic_app/global/constants/ui.const.dart';
import 'package:get_it/get_it.dart';
import 'package:easy_reo_fonts/easy_reo_fonts.dart';

import '../../modules/enrollment/service/enrollment.service.dart';
import '../constants/validations.const.dart';

GetIt getIt = GetIt.instance;

setupGetIt() {
    //*--- font
  getIt.registerLazySingleton<KStyles>(() {
    return KStyles(fontFamily: 'Poppins', fontType: FontType.googleFonts);}, instanceName: 'Poppins'
  );
  getIt.registerSingleton<TextFieldValidation>(TextFieldValidation());
    getIt.registerLazySingleton<UiConstants>(() {
    return UiConstants();
  });
  getIt.registerSingleton<EnrollmentService>(EnrollmentService());

}
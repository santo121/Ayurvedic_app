

import 'package:ayurvedic_app/global/constants/ui.const.dart';
import 'package:easy_reo_fonts/easy_reo_fonts.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../dependency_injection/di.dart';

//*---------- (Global Context)
BuildContext globalContext = navigationKey.currentState!.context;
//*---------- (Media_Query)
Size size = MediaQuery.sizeOf(globalContext);
//*---------- (fonts)
KStyles kStyles = getIt<KStyles>(instanceName: 'Poppins');
//*---------- (UI constant object)
UiConstants uiCon = getIt<UiConstants>();
//*---------- (API base url constant)
const String baseUrl = 'https://flutter-amr.noviindus.in/api/';
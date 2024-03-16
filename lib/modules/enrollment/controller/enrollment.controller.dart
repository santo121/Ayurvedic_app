import 'dart:convert';

import 'package:ayurvedic_app/modules/enrollment/model/enroll_response.model.dart';
import 'package:flutter/material.dart';

import '../../../global/config/db.config.dart';
import '../../../global/dependency_injection/di.dart';
import '../../../global/interceptor/network.interceptor.dart';
import '../service/enrollment.service.dart';

class EnrollmentController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWord = TextEditingController();
  EnrollResponseModel enrollmentModel = EnrollResponseModel();
  bool apiLoader = false;
  onInit() {
    emailController.clear();
    passWord.clear();
    apiLoader = false;
    notifyListeners();
  }

  Future<bool> callLoginService() async {
    apiLoader = true;
    notifyListeners();
    final response = await getIt<EnrollmentService>().enrollUserApiService(
        email: emailController.text, password: passWord.text);
    if (json.decode(response.body)['status'].toString() == 'false') {
      apiLoader = false;
      notifyListeners();
      return false;
    } else {
      apiLoader = false;
      enrollmentModel =
          EnrollResponseModel.fromJson(json.decode(response.body));
      userInfo.put(DbKey().tokenKey,json.decode(response.body)['token']);
      notifyListeners();
      return true;
    }
  }
}

import 'dart:convert';

import 'package:ayurvedic_app/modules/Patient_list/model/patients_list.model.dart';
import 'package:flutter/material.dart';

import '../service/patient_list.service.dart';

class PatientsListController with ChangeNotifier {
  PatientsDataList patientList = PatientsDataList();
  //---------------------------------------------------------------- (API call)

  getPatentsList() async {
    final response = await PatientListService().getPatientsList();
    if (response.statusCode == 200) {
      patientList = PatientsDataList.fromJson(json.decode(response.body));
      notifyListeners();
    }
  }
}

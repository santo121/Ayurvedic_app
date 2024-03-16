import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../model/patient_branch.model.dart';
import '../model/treatment_list.model.dart';
import '../service/patient_registration.service.dart';

class PatientRegisterController with ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController excecutive = TextEditingController();
  TextEditingController payment = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController totalAmount = TextEditingController();
  TextEditingController discountAmount = TextEditingController();
  TextEditingController advanceAmount = TextEditingController();
  TextEditingController balanceAmount = TextEditingController();
  TextEditingController date_nd_time = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController male = TextEditingController();
  TextEditingController female = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController treatments = TextEditingController();
DateRangePickerController? controller = DateRangePickerController();
List<TreatMentModel> treatmentList =[];
int femaleCount = 0;
int maleCount = 0;

setPaymentOption(String paymentOptions){
  payment.text = paymentOptions;
  notifyListeners();
}

addTreatment(TreatMentModel data){
  if(data.treatment.isNotEmpty&&data.treatment!='null'){
  treatmentList.add(data);
  }
  notifyListeners();
}

selectedDate(DateTime date){
date_nd_time.text = DateFormat('dd/MM/yyy').format(date);
notifyListeners();
}

removeAddedTreatment(int index){
treatmentList.removeAt(index);
notifyListeners();
}

addMailCount(){
  maleCount+=1;
  notifyListeners();
}
minusMailCount(){
  if(maleCount<=0){}
  else{
  maleCount-=1;

  }
  notifyListeners();
}
addFemaleCount(){
  femaleCount+=1;
  notifyListeners();
}
minusFemaleCount(){
  if(femaleCount<=0){}
  else{
  femaleCount-=1;

  }
  notifyListeners();
}

  bool apiLoading = false;
  BranchList branchList = BranchList();
  TreatmentListModel treatmentListModel = TreatmentListModel();
String selectedBranchId ='0';
  setBranchName(String selectedBranch,String branchId){
    branch.text = selectedBranch;
    branch.text = selectedBranch;
    selectedBranchId =branchId;
    notifyListeners();
  }
  int? treatmentId;
  setTreatmentName(String selectedBranch,int treatmentIdData){
    treatments.text = selectedBranch;
    treatmentId = treatmentIdData;
    notifyListeners();
  }
  //---------------------------------------------------------------- (API service)
  getBranches() async {
    apiLoading = true;
    notifyListeners();
    final response = await PatientRegistrationService().getBranch();
    if (response.statusCode == 200) {
      branchList = BranchList.fromJson(json.decode(response.body));
      apiLoading = false;

      notifyListeners();
    } else {
      apiLoading = false;

      notifyListeners();
    }
  }

  getTreatmentList() async {
    apiLoading = true;
    notifyListeners();
    final response = await PatientRegistrationService().getTreatmentList();
    if (response.statusCode == 200) {
      treatmentListModel =
          TreatmentListModel.fromJson(json.decode(response.body));
      apiLoading = false;

      notifyListeners();
    } else {
      apiLoading = false;

      notifyListeners();
    }
  }

  callNewApiService()async{
    final response = await PatientRegistrationService().createNewPatient({
'name':name.text,
'payment':payment.text,
'excecutive':'',
'phone':phone.text,
'address':address.text,
'total_amount':totalAmount.text,
'discount_amount':discountAmount.text,
'advance_amount':advanceAmount.text,
'balance_amount':balanceAmount.text,
'date_nd_time':date_nd_time.text,
'id':'1',
'male':getTreatmentId(),
'female':getTreatmentId(),
'branch':selectedBranchId,
'treatments':getTreatmentId()
    });

    if(response.statusCode==200){}
    else{

    }
  }


String getTreatmentId(){
  List<String> id = [];
  for(final i in treatmentList){
id.add(i.selectedId);

  }
  return id.join(',');

}


}


class TreatMentModel{
 final String treatment;
 final String mailCount;
 final String femaleCount;
 final String selectedId;
  TreatMentModel({required this.treatment, required this.mailCount, required this.femaleCount, required this.selectedId});
}
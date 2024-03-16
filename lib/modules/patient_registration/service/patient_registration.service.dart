import 'package:http/http.dart';

import '../../../global/config/api_urls.config.dart';
import '../../../global/config/db.config.dart';
import '../../../global/interceptor/network.interceptor.dart';

class PatientRegistrationService{
    //*--- Get store list api service
  Future<Response> getBranch() async {
    return await httpRequests(
      headers: {
        'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey)}',
        'content-type': 'application/json'
      },
      url: ApiUrl().getBranch,
      httpType: HttpMethods.get,
    );
  }
  Future<Response> getTreatmentList() async {
    return await httpRequests(
      headers: {
        'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey)}',
        'content-type': 'application/json'
      },
      url: ApiUrl().getTreatmentList,
      httpType: HttpMethods.get,
    );
  }
  Future<Response> createNewPatient(Object? body) async {
    return await httpRequests(
      headers: {
        'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey)}',
   
      },
      body: body,
      url: ApiUrl().patientUpdate,
      httpType: HttpMethods.post,
    );
  }


}
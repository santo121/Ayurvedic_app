import 'package:http/http.dart';

import '../../../global/config/api_urls.config.dart';
import '../../../global/config/db.config.dart';
import '../../../global/interceptor/network.interceptor.dart';

class PatientListService{


  //*--- Get store list api service
  Future<Response> getPatientsList() async {
    return await httpRequests(
      headers: {
        'Authorization': 'Bearer ${userInfo.get(DbKey().tokenKey)}',
        'content-type': 'application/json'
      },
      url: ApiUrl().getPatientsList,
      httpType: HttpMethods.get,
    );
  }
}
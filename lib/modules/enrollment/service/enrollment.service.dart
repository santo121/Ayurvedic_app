
// import 'package:ayurvedic_app/global/config/db.config.dart';
import 'package:http/http.dart';

import '../../../global/config/api_urls.config.dart';
// import '../../../global/dependency_injection/di.dart';
import '../../../global/interceptor/network.interceptor.dart';
import 'package:http/http.dart' as http;
class EnrollmentService {
  //  Future<Response> enrollUserApiService(Object? body)async{
    //?---------------------------------------------------------------- ( create enquiry service request )
  Future<Response> enrollUserApiService({
    required String email,
    required String password,
  }) async {
    
    final request =
        http.MultipartRequest('POST', Uri.parse(ApiUrl().loginApi));
    request.fields["username"] = email;
    request.fields["password"] = password;
    return await httpRequests(
        httpType: HttpMethods.multipart,
        url: ApiUrl().loginApi,
        multipartRequest: request);

//?---------------------------------------------------------------- ( create enquiry service request )
  }

  }




import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TenantSignUpAPI {
  static const String url = "https://pexzaapp.com/api/v1/auth/tenant/register";
  Future<Response> signup(
      {String firstname,
      String lastname,
      String phoneNumber,
      String email,
      String password,
      String age,
      String gender}) async {
    try {
      var res = await http.post(url, body: {
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "phone": phoneNumber,
        "password": password,
        "age": age,
        "gender": gender
      }, headers: {
        'Accept': 'application/json',
      });
      print(res);
      return res;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

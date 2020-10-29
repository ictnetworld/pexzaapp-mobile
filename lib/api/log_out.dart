import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LogoutAPI {
  Future<Response> logout(String token) async {
    String url = "https://pexzaapp.com/api/v1/auth/logout";
    var log = http.post(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return log;
  }
}

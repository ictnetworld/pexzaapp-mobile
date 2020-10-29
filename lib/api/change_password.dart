import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';

class PasswordResetApi {
  var prefs = locator<PrefsManager>();
  Future<Response> requestReset(String email) async {
    const String url = "https://pexzaapp.com/api/v1/auth/password/reset/send";
    var req = await http.post(url, body: {
      "email": email
    }, headers: {
      'Accept': 'application/json',
    });
    if (req.statusCode == 200) {
      return req;
    }
    return null;
  }

  Future<Response> verify({String code, String email}) async {
    String url =
        "https://pexzaapp.com/api/v1/auth/password/$code/$email/verify";
    var verified = await http.get(url, headers: {
      'Accept': 'application/json',
    });
    if (verified.statusCode == 200) {
      return verified;
    }
    return null;
  }

  Future<Response> newPassword({String password, String email}) async {
    String url = "https://pexzaapp.com/api/v1/auth/password/reset";
    var newPass = http.post(url,
        body: {"email": email, "password": password, "signature": "signature"},
        headers: {'Accept': 'application/json'});
    return newPass;
  }

  Future<Response> updatePassword(
      {String oldPassword, String newPassword, String token}) async {
    String url = "https://pexzaapp.com/api/v1/user/password/update";
    var upPass = http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      "password": newPassword,
      "old_password": oldPassword
    });
    return upPass;
  }
}

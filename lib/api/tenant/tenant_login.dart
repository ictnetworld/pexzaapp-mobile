import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pexza/models/tenant/tenant_login_model.dart';
import 'package:http/http.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';

class TenantSignInAPI {
  var prefs = locator<PrefsManager>();
  static const String url = "https://pexzaapp.com/api/v1/auth/tenant/login";
  Future<Response> signIn({String phoneNumber, String password}) async {
    try {
      var res = http.post(url, body: {
        "phone": phoneNumber,
        "password": password
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

  Future<TenantIndividual> getUser({String token}) async {
    String url = "https://pexzaapp.com/api/v1/user";
    var user = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    prefs.setTenantDetails(user.body);
    if(user.statusCode == 200){
      return TenantDetails.fromJson(jsonDecode(user.body)).data;
    }
    return null;
  }
}

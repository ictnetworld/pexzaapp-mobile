import 'dart:convert';

import 'package:http/http.dart';
import 'package:pexza/models/landlord/landlord_login_model.dart';
import 'package:http/http.dart' as http;
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';

class LandLordSignInAPI {
  var prefs = locator<PrefsManager>();
  static const String url = "https://pexzaapp.com/api/v1/auth/landlord/login";
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
  Future<Landlordperson> getUser(String token) async {
    const userUrl = "https://pexzaapp.com/api/v1/user";
    var user = await http.get(userUrl, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    await prefs.setLandLordDetails(user.body);
    print("How about ${await prefs.getLandLordDetails()}");
    if (user.statusCode == 200) {
      return LandLordIndividual.fromJson(jsonDecode(user.body)).landlordperson;
    } else {
      return null;
    }
  }

}

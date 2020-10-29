import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CreateTenantAPI {
  Future<Response> addTenant(
      {String email,
      String payPlan,
      String duration,
      String currency,
      String amount,
      String id,
      String token}) async {
    var check = await http
        .get("https://pexzaapp.com/api/v1/user/$email/get", headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (check.statusCode == 200) {
      var tenantid = jsonDecode(check.body)["data"]["id"];
      // await locator<PrefsManager>().setTenantId(tenantid);
      var add = await http.post(
        "https://pexzaapp.com/api/v1/apartments/$id/assign",
        body: {
          "tenant_id": tenantid.toString(),
          "payment_plan": payPlan,
          "duration": duration,
          "currency": currency,
          "amount": amount,
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return add;
    }
    if(check.statusCode == 404){
      return check;
    }
    return null;
  }
}

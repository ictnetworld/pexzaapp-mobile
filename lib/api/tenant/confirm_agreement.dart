import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pexza/models/payment_model.dart';
import 'package:pexza/models/tenant/apartment.dart';
// import 'package:pexza/models/tenant/apartment.dart';

class ConfirmAgreementAPI {
  Future<Response> confirm({String code, String token}) async {
    String url = "https://pexzaapp.com/api/v1/apartments/$code/pair";
    var confirming = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(confirming.statusCode);
    // if(confirming.statusCode == 200){
    //   return AssignedApartment.fromJson(jsonDecode(confirming.body));
    // }if(confirming.statusCode == 403){
    //   return null;
    // }
    return confirming;
  }

  Future<Assignment> getDetails({String token, String email}) async {
    String url = "https://pexzaapp.com/api/v1/user/$email/get";
    print(url);
    var details = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(details.body);
    if (details.statusCode == 200) {
      return ApartmentDetails.fromJson(jsonDecode(details.body))
          .data
          .assignment;
    }
    return null;
  }

  Future<AuthPayment> pay(
      {String amount, String duration, String currency, String token}) async {
    String url = "https://pexzaapp.com/api/v1/payment/initiate";
    var pay = await http.post(url, body: {
      "payment_method": "paystack",
      "amount": amount,
      "currency": currency,
      "duration": duration,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (pay.statusCode == 200) {
      return AuthPayment.fromJson(jsonDecode(pay.body));
    }
    return null;
  }

  Future<Response> packOut({String token, String apartmentId}) async {
    String url = "https://pexzaapp.com/api/v1/apartments/$apartmentId/pack-out";
    var out = http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return out;
  }

  Future<PayPalAuth> payPal(
      {String amount, String duration, String currency, String token}) async {
    String url = "https://pexzaapp.com/api/v1/payment/initiate";
    var pay = await http.post(url, body: {
      "payment_method": "paypal",
      "amount": amount,
      "currency": currency,
      "duration": duration,
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(pay.body);
    print("Now here");
    if (pay.statusCode == 200) {
      return PayPalAuth.fromJson(jsonDecode(pay.body));
    }
    return null;
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pexza/models/landlord/maintainance_req_model.dart';
import 'package:pexza/models/tenant/maintainance_req.dart';

class MaintainanceAPI {
  Future<Response> requestFix(
      {String duty, String level, String id, String token}) async {
    String url = "https://pexzaapp.com/api/v1/maintenance/store";
    var req = await http.post(url, body: {
      "duty": duty,
      "level": level,
      "landlord_id": id
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return req;
  }

  Future<List<Requests>> allFixRequestTenantForLandLord(
      {String id, String token}) async {
    String url = "https://pexzaapp.com/api/v1/maintenance/tenant/$id/show";
    var req = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (req.statusCode == 200) {
      final Iterable needed = jsonDecode(req.body)["data"];
      return needed.map((fixreq) => Requests.fromJson(fixreq)).toList();
    }
    return null;
  }

  Future<List<Req>> allFixRequestsTenant(String token) async {
    String url = "https://pexzaapp.com/api/v1/maintenance/tenant";
    var req = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print("Not the VM bro ${TenantMaintainces.fromJson(jsonDecode(req.body))}");
    if (req.statusCode == 200) {
      final Iterable needed = jsonDecode(req.body)["data"];
      return needed.map((fixreq) => Req.fromJson(fixreq)).toList();
    }
    return null;
  }

  Future<List<Fixed>> allFixedRequestsTenant(String token) async {
    String url = "https://pexzaapp.com/api/v1/maintenance/tenant/fixed";
    var ask = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (ask.statusCode == 200) {
      final Iterable needed = jsonDecode(ask.body)["data"];
      return needed.map((fixreq) => Fixed.fromJson(fixreq)).toList();
    }
    return null;
  }

  Future<Response> fixed({String id, String token}) async {
    String url = "https://pexzaapp.com/api/v1/maintenance/$id/set-fixed";
    var fix = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return fix;
  }

  Future<Response> unFixed({String id, String token}) async {
    String url = "https://pexzaapp.com//api/v1/maintenance/$id/set-unfixed";
    var fix = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return fix;
  }

  Future<List<Requests>> allFixRequestsForLandLord({String token}) async {
    String url = "https://pexzaapp.com/api/v1/maintenance/";
    var req = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (req.statusCode == 200) {
      final Iterable needed = jsonDecode(req.body)["data"];
      return needed.map((fixreq) => Requests.fromJson(fixreq)).toList();
    }
    return null;
  }
}

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pexza/models/landlord/your_tenants.dart';

class GetTenants {
  Future<List<YourTenants>> getTenants({String token}) async {
    String url = "https://pexzaapp.com/api/v1/user/tenants";
    var getthem = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final Iterable need = jsonDecode(getthem.body);
    return need.map((heh) => YourTenants.fromJson(heh)).toList();
  }
}

import 'dart:convert';

import 'package:pexza/models/landlord/landlord_statistics.dart';
import 'package:pexza/models/payment_model.dart';
import 'package:http/http.dart' as http;
import 'package:pexza/models/tenant/payment_history.dart';

class StatisticsAPI {
  Future<Stats> getPaymentStat(String token) async {
    String url = "http://pexzaapp.com/api/v1/payment/stats";
    var weget = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // print(Dstat.fromJson(jsonDecode(weget.body)).stats);
    return Dstat.fromJson(jsonDecode(weget.body)).stats;
  }

  Future<Doingwell> landlordstats(String token) async {
    String url = "https://pexzaapp.com/api/v1/user/stats";
    var stats = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return LandlordStats.fromJson(jsonDecode(stats.body)).doingwell;
  }

  Future<List<History>> paymentHistory(String token) async {
    String url = "https://pexzaapp.com/api/v1/payment/history";
    var history = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return PaymentHistory.fromJson(jsonDecode(history.body)).history;
  }
}

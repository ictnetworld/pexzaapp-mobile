import 'dart:convert';

import 'package:pexza/models/landlord/landlord_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  Future<bool> setLandLordToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("LandlordToken", value);
    return updated;
  }

  Future<String> getLandLordToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("LandlordToken") ?? '';
  }

  Future<bool> catchEmail(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("DEmail", value);
    return updated;
  }

  Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("DEmail");
  }

  Future<bool> setTenantToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("TenantToken", value);
    return updated;
  }

  Future<String> getTenantToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("TenantToken") ?? '';
  }

  Future<bool> setLandLordId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("LandlordId", value);
    return updated;
  }

  Future<String> getLandLordId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("LandlordId") ?? '';
  }

  Future<bool> sethasPaid(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setBool("haspaid", value);
    return updated;
  }

  Future<bool> gethasPaid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("haspaid") ?? false;
  }

  Future<bool> setTenantId(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("TenantId", value);
    return updated;
  }

  Future<String> getTenantId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("TenantId") ?? '';
  }

  Future<bool> catchEmailForPasswordResetLand(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("Zemail", value);
    return updated;
  }

  Future<String> getEmailForPasswordResetLand() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Zemail") ?? '';
  }

    Future<bool> catchEmailForPasswordResetTenant(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var updated = prefs.setString("ZemailT", value);
    return updated;
  }

  Future<String> getEmailForPasswordResetTenant() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ZemailT") ?? '';
  }

  Future<bool> setLandLordDetails(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var landlord = prefs.setString("LandLordDetails", value);
    return landlord;
  }

  Future<String> getLandLordDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("LandLordDetails") ?? {};
  }

  Future<bool> setTenantDetails(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var tenant = prefs.setString("TenantDetails", value);
    return tenant;
  }

  Future<String> getTenantDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("TenantDetails") ?? {};
  }

  Future<bool> landlordhasLoggedIn(bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isloggedin = prefs.setBool("landlordisloggedin", value);
    return isloggedin;
  }
  Future<bool> getlandlordHasLoggedin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("landlordisloggedin") ?? false;
  }
    Future<bool> tenanthasLoggedIn(bool value)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isloggedin = prefs.setBool("tenantisloggedin", value);
    return isloggedin;
  }
  Future<bool> gettenantHasLoggedin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("tenantisloggedin") ?? false;
  }
}

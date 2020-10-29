import 'dart:convert';

import 'package:pexza/api/log_out.dart';
import 'package:pexza/api/tenant/tenant_login.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/tenant/tenant_login_model.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class TenantSigninViewModel extends BaseModel {
  var sigin = locator<TenantSignInAPI>();
  var nav = locator<NavigationService>();
  var dialognav = locator<DialogService>();
  TenantIndividual user = TenantIndividual();
  var prefs = locator<PrefsManager>();
  var log = locator<LogoutAPI>();

  // Sign in user
  Future signin({String phoneNumber, String password}) async {
    setBusy(true);

    var res =
        await sigin.signIn(phoneNumber: "0" + phoneNumber, password: password);
    // prefs.tenanthasLoggedIn(true);
    setBusy(false);
    await prefs.setTenantToken(jsonDecode(res.body)["access_token"]);

    var paid = await prefs.gethasPaid();

    if (res.statusCode == 200) {
      if (paid == true) {
        nav.navigateTo(TenantLandingView);
        prefs.tenanthasLoggedIn(true);
      } else {
        nav.navigateTo(ConfirmLandLordView);
      }
      setBusy(false);
    }
    if (res.statusCode == 401) {
      dialognav.showDialog(
          title: "Error!",
          description: "This user does not exist",
          buttonTitle: "Okay");
      setBusy(false);
    }
    if (res.statusCode == 406) {
      dialognav.showDialog(
          title: "Error!",
          description: "Check your details and try again",
          buttonTitle: "Okay");
      setBusy(false);
    }
    if (res.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
      setBusy(false);
    }
    if (res.statusCode == 405) {
      dialognav.showDialog(
          title: "Error!",
          description:
              "Server Error we are attending to this now, try again later",
          buttonTitle: "Try Again");
      setBusy(false);
    }
    notifyListeners();
  }

  Future getUser() async {
    setBusy(true);
    final token = await prefs.getTenantToken();
    var userRes = await sigin.getUser(token: token);
    this.user = userRes;
    print(userRes.age);
    setBusy(false);
    await prefs.catchEmail(userRes.email);
    notifyListeners();
  }

  Future tenantOut() async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var out = await log.logout(token);
    if (out.statusCode == 200) {
      setBusy(false);
      if (jsonDecode(out.body)["status"] == "success") {
        nav.navigateTo(ChooseView);
        prefs.tenanthasLoggedIn(false);
      }
    }
    if (jsonDecode(out.body)["status"] == "failed") {
      dialognav.showDialog(
          title: "Failed!",
          description: "Failed to Logout",
          buttonTitle: "Try again");
    }
    notifyListeners();
  }
}

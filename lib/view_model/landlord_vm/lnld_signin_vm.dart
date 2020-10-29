import 'dart:convert';

import 'package:pexza/api/landlord/landlord_login.dart';
import 'package:pexza/api/log_out.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/landlord/landlord_login_model.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class LandLordSignInViewModel extends BaseModel {
  var sigin = locator<LandLordSignInAPI>();
  var nav = locator<NavigationService>();
  var dialognav = locator<DialogService>();
  var prefs = locator<PrefsManager>();
  var log = locator<LogoutAPI>();
  Landlordperson user = Landlordperson();

  Future signin({String phoneNumber, String password}) async {
    setBusy(true);
    var res =
        await sigin.signIn(phoneNumber: "0" + phoneNumber, password: password);
    setBusy(false);
    await prefs.setLandLordToken(jsonDecode(res.body)["access_token"]);
    if (res.statusCode == 200) {
      nav.navigateTo(LandLordDashView);
      prefs.landlordhasLoggedIn(true);
      setBusy(false);
    }
    if (res.statusCode == 401) {
      dialognav.showDialog(
        title: "Error!",
        description: "This user does not exist or one of the inputs are wrong",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    if (res.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
      setBusy(false);
    }
    notifyListeners();
  }

  Future landlordOut() async {
    setBusy(true);
    var token = await prefs.getLandLordToken();
    var out = await log.logout(token);
    if (out.statusCode == 200) {
      setBusy(false);
      if (jsonDecode(out.body)["status"] == "success") {
        nav.navigateTo(ChooseView);
        prefs.landlordhasLoggedIn(false);
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

  Future getUser() async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    var userRes = await sigin.getUser(token);
    this.user = userRes;
    setBusy(false);
    // await prefs.catchEmail(userRes.email);
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:pexza/api/change_password.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class ResetPasswordViewModel extends BaseModel {
  var prefs = locator<PrefsManager>();
  var reset = locator<PasswordResetApi>();
  var dialognav = locator<DialogService>();
  var nav = locator<NavigationService>();

  Future requestResetLand({String email}) async {
    setBusy(true);
    var req = await reset.requestReset(email);
    await prefs.catchEmailForPasswordResetLand(email);
    setBusy(false);
    if (jsonDecode(req.body)["status"] == "success") {
      nav.navigateTo(PasswordResetViewLand);
      dialognav.showDialog(
          title: "Alert!",
          description: "A verifiication code has been sent to your email",
          buttonTitle: "Okay");
    }
    if (req.statusCode == 422) {
      dialognav.showDialog(
          title: "Error!",
          description: "This is not a valid email",
          buttonTitle: "Okay");
    }
    notifyListeners();
  }

  Future requestResetTenant({String email}) async {
    setBusy(true);
    var req = await reset.requestReset(email);
    await prefs.catchEmailForPasswordResetTenant(email);
    setBusy(false);
    if (jsonDecode(req.body)["status"] == "success") {
      nav.navigateTo(PasswordResetViewTenant);
      dialognav.showDialog(
          title: "Alert!",
          description: "A verifiication code has been sent to your email",
          buttonTitle: "Okay");
    }
    if (req.statusCode == 422) {
      dialognav.showDialog(
          title: "Error!",
          description: "This is not a valid email",
          buttonTitle: "Okay");
    }
    notifyListeners();
  }

  void onOTPFieldError() {
    dialognav.showDialog(
        title: "Error!",
        description: "This code has been used",
        buttonTitle: "Okay");
    notifyListeners();
  }

  void onOTPField() {
    dialognav.showDialog(
        title: "Error!",
        description: "This code is incomplete",
        buttonTitle: "Okay");
    notifyListeners();
  }

  Future verifyLand({String code}) async {
    setBusy(true);
    var mail = await prefs.getEmailForPasswordResetLand();
    var verified = await reset.verify(code: code, email: mail);
    print(verified);
    setBusy(false);
    if (jsonDecode(verified.body)["status"] == "success") {
      nav.navigateTo(ResetPasswordViewLand);
    } else if (jsonDecode(verified.body)["status"] == "failed") {
      onOTPFieldError();
    }
    notifyListeners();
  }

  Future setNewPasswordLand({String password}) async {
    setBusy(true);
    var mail = await prefs.getEmailForPasswordResetLand();
    var zePass = await reset.newPassword(password: password, email: mail);
    setBusy(false);
    if (jsonDecode(zePass.body)["status"] == "success") {
      dialognav.showDialog(
        title: "Success!",
        description: "You have successfully reset your password",
        buttonTitle: "Okay",
      );
      nav.navigateTo(LandLordSignInView);
      setBusy(false);
      await prefs.catchEmailForPasswordResetLand("");
      if (jsonDecode(zePass.body)["status"] == "failed") {
        dialognav.showDialog(
            title: "Failed!",
            description: "Failed to reset password",
            buttonTitle: "Okay");
        setBusy(false);
      }
    }
    notifyListeners();
  }

  Future verify({String code}) async {
    setBusy(true);
    var mail = await prefs.getEmailForPasswordResetTenant();
    var verified = await reset.verify(code: code, email: mail);
    setBusy(false);
    if (jsonDecode(verified.body)["status"] == "success") {
      nav.navigateTo(ResetPasswordViewTenant);
    } else if (jsonDecode(verified.body)["status"] == "failed") {
      onOTPFieldError();
    }
  }

  Future setNewPassword({String password}) async {
    setBusy(true);
    var mail = await prefs.getEmailForPasswordResetTenant();
    var zePass = await reset.newPassword(password: password, email: mail);
    setBusy(false);
    if (jsonDecode(zePass.body)["status"] == "success") {
      dialognav.showDialog(
        title: "Success!",
        description: "You have successfully reset your password",
        buttonTitle: "Okay",
      );
      nav.navigateTo(TenantSignInView);
      setBusy(false);
      await prefs.catchEmailForPasswordResetTenant("");
      if (jsonDecode(zePass.body)["status"] == "failed") {
        dialognav.showDialog(
            title: "Failed!",
            description: "Failed to reset password",
            buttonTitle: "Okay");
        setBusy(false);
      }
    }
    notifyListeners();
  }

  Future updateLandLordPassword(
      {String newPassword, String oldPassword}) async {
    setBusy(true);
    var token = await prefs.getLandLordToken();
    var update = await reset.updatePassword(
        newPassword: newPassword, oldPassword: oldPassword, token: token);
    if (update.statusCode == 200) {
      dialognav.showDialog(
        title: "Success!",
        description: "Your password has been successfully updated",
        buttonTitle: "Okay",
      );
      prefs.landlordhasLoggedIn(false);
      setBusy(false);
    }
    if (update.statusCode == 422) {
      dialognav.showDialog(
        title: "Error!",
        description: "Your password is incorrect",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    if (update.statusCode == 500) {
      dialognav.showDialog(
        title: "Server!",
        description: "Server is currently being maintained",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    notifyListeners();
  }

  Future updateTenantPassword({String newPassword, String oldPassword}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var update = await reset.updatePassword(
        newPassword: newPassword, oldPassword: oldPassword, token: token);
    if (update.statusCode == 200) {
      dialognav.showDialog(
        title: "Success!",
        description: "Your password has been successfully updated",
        buttonTitle: "Okay",
      );
      prefs.tenanthasLoggedIn(false);
      setBusy(false);
    }
    if (update.statusCode == 422) {
      dialognav.showDialog(
        title: "Error!",
        description: "Your password is incorrect",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    if (update.statusCode == 500) {
      dialognav.showDialog(
        title: "Server!",
        description: "Server is currently being maintained",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    notifyListeners();
  }
}

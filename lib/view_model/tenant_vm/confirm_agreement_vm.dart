import 'dart:convert';

import 'package:pexza/api/tenant/confirm_agreement.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/tenant/apartment.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class ConfirmAgreementViewModel extends BaseModel {
  var prefs = locator<PrefsManager>();
  var conf = locator<ConfirmAgreementAPI>();
  Assignment agree = Assignment();
  var dialognav = locator<DialogService>();
  var nav = locator<NavigationService>();

  // bool _stat;
  // bool get dstat => _stat;

  Future confirmTerms({String code}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var confirmIt = await conf.confirm(code: code, token: token);
    // print(confirmIt.body);
    setBusy(false);
    if (confirmIt.statusCode == 200 &&
        jsonDecode(confirmIt.body)["status"] != "failed") {
      nav.navigateTo(AgreeTermsView);
      setBusy(false);
    }
    if (confirmIt.statusCode == 403) {
      dialognav.showDialog(
          title: "Pair Error",
          description:
              "This house has been assigned to someone or you have not been assigned a house",
          buttonTitle: "Okay");
    }
    if (confirmIt.statusCode == 408) {
      dialognav.showDialog(
          title: "Request Error",
          description: "Request Timed Out, Try again later",
          buttonTitle: "Okay");
    }
    if (confirmIt.statusCode == 200 &&
        jsonDecode(confirmIt.body)["status"] == "failed") {
      dialognav.showDialog(
          title: "Pair Error",
          description:
              "This otp code is wrong",
          buttonTitle: "Okay");
    }
    notifyListeners();
  }

  void onOtpIncomplete() {
    dialognav.showDialog(
        title: "Otp Incomplete",
        description: "Otp Field is incomplete",
        buttonTitle: "Okay");
  }

  Future getDetail() async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var email = await prefs.getEmail();
    var detail = await conf.getDetails(email: email, token: token);
    setBusy(false);
    this.agree = detail;
    print("Na me this ${detail.landlordId}");
    await prefs.setLandLordId(detail.landlordId);
    notifyListeners();
  }

  Future pay({String amount, String duration, String currency}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var initPay = await conf.pay(
        amount: amount, duration: duration, currency: currency, token: token);
    setBusy(false);
    nav.navigateTo(PaymentsView, arguments: initPay.authorizationUrl);
  }

  Future paypal({String amount, String duration, String currency}) async {
    if (currency != "USD") {
      dialognav.showDialog(
          title: "Currency Error!",
          description:
              "This Naira is not accepted on Paypal notify the landlord of this!",
          buttonTitle: "Okay");
    } else {
      setBusy(true);
      var token = await prefs.getTenantToken();
      print("Here now");
      var initPay = await conf.payPal(
          amount: amount, duration: duration, currency: currency, token: token);
      setBusy(false);
      nav.navigateTo(PaymentsView, arguments: initPay.link.href);
    }
  }

  Future leave({String id}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var pack = await conf.packOut(token: token, apartmentId: id);
    setBusy(false);
    if (pack.statusCode == 200) {
      dialognav.showDialog(
        title: "Success",
        description: "You have successfully packed out",
        buttonTitle: "Okay",
      );
      nav.navigateTo(ChooseView);
      await prefs.sethasPaid(false);
      setBusy(false);
    }
    if (pack.statusCode == 500) {
      dialognav.showDialog(
        title: "Server Error",
        description: "Server is currently under maintainance, Try again later",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    notifyListeners();
  }

  // void paystatus() async {
  //   _stat = await locator<PrefsManager>().gethasPaid();
  //   notifyListeners();
  // }
}

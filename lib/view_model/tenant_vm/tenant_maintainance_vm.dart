import 'package:pexza/api/tenant/request_fix.dart';
import 'package:pexza/models/tenant/maintainance_req.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class TenenantMaintainanceViewModel extends BaseModel {
  var prefs = locator<PrefsManager>();
  var dialognav = locator<DialogService>();
  var maintain = locator<MaintainanceAPI>();
  List<Req> req = List<Req>();
  List<Fixed> fixes = List<Fixed>();

  Future fixRequest({String duty, String level}) async {
    setBusy(true);
    var id = await prefs.getLandLordId();
    var token = await prefs.getTenantToken();
    var fixSent = await maintain.requestFix(
        duty: duty, level: level, id: id, token: token);
    setBusy(false);
    print(fixSent.statusCode);
    if (fixSent.statusCode == 201) {
      dialognav.showDialog(
          title: "Success!",
          description: "Your request for a fix has been sent",
          buttonTitle: "Okay");
    }
    if (fixSent.statusCode == 408) {
      dialognav.showDialog(
          title: "Request Error",
          description: "Request Timed Out, Try again later",
          buttonTitle: "Okay");
    }
    if (fixSent.statusCode == 422) {
      dialognav.showDialog(
          title: "Error",
          description: "You can't ask for a fix if you are not a tenant",
          buttonTitle: "Okay");
    }
    notifyListeners();
  }

  Future allRequests() async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var demRequests = await maintain.allFixRequestsTenant(token);
    this.req = demRequests;
    setBusy(false);
    notifyListeners();
  }

  Future allFixedRequest() async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var fixed = await maintain.allFixedRequestsTenant(token);
    this.fixes = fixed;
    setBusy(false);
    notifyListeners();
  }

  Future setFixed({String id}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var fixing = await maintain.fixed(token: token, id: id);
    setBusy(false);
    if (fixing.statusCode == 200) {
      dialognav.showDialog(
          title: "Success!",
          description: "The Landlord has been notified of this situation",
          buttonTitle: "Ok");
      setBusy(false);
    }
    if (fixing.statusCode == 500) {
      dialognav.showDialog(
          title: "Server Error!",
          description: "The server is under maintainance, try again later",
          buttonTitle: "Ok");
      setBusy(false);
    }
  }

  Future setUnFixed({String id}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var fixing = await maintain.unFixed(token: token, id: id);
    setBusy(false);
    if (fixing.statusCode == 200) {
      dialognav.showDialog(
          title: "Success!",
          description: "The Landlord has been notified of this situation",
          buttonTitle: "Ok");
      setBusy(false);
    }
    if (fixing.statusCode == 500) {
      dialognav.showDialog(
          title: "Server Error!",
          description: "The server is under maintainance, try again later",
          buttonTitle: "Ok");
      setBusy(false);
    }
  }
}

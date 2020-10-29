import 'package:pexza/api/landlord/create_tenant.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class CreateTenantViewModel extends BaseModel {
  var createTenant = locator<CreateTenantAPI>();
  var prefs = locator<PrefsManager>();
  var dialognav = locator<DialogService>();
  Future addTenant(
      {String email,
      String payPlan,
      String duration,
      String currency,
      String amount,
      String id}) async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    var add = await createTenant.addTenant(
      email: email,
      payPlan: payPlan,
      duration: duration,
      currency: currency,
      amount: amount,
      id: id,
      token: token,
    );
    setBusy(false);
    print(add.statusCode);
    print(add.body);
    if (add.statusCode == 404) {
      dialognav.showDialog(
          title: "Error!",
          description: "This Tenant has not registered or the email is wrong",
          buttonTitle: "Okay");
      setBusy(false);
    }
    if (add.statusCode == 408) {
      dialognav.showDialog(
          title: "Request Error!",
          description: "Request Timed Out",
          buttonTitle: "Try again");
      setBusy(false);
    }
    if (add.statusCode == 200 || add.statusCode == 201) {
      dialognav.showDialog(
        title: "Success!",
        description: "A confirmation E-mail has been sent to the tenant",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    if (add.statusCode == 403) {
      dialognav.showDialog(
        title: "Error!",
        description: "Apartment has been assigned to a Tenant",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    notifyListeners();
  }
}

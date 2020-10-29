import 'package:pexza/api/landlord/get_tenants.dart';
import 'package:pexza/models/landlord/your_tenants.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class GetThemViewModel extends BaseModel {
  var prefs = locator<PrefsManager>();
  List<YourTenants> mepeep = List<YourTenants>();

  Future getAllTenants() async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    var themp = await GetTenants().getTenants(token: token);
    setBusy(false);
    this.mepeep = themp;
    notifyListeners();
  }
}

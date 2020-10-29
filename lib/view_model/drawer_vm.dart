import 'dart:convert';

import 'package:pexza/models/landlord/landlord_login_model.dart';
import 'package:pexza/models/landlord/maintainance_req_model.dart';
import 'package:pexza/models/tenant/tenant_login_model.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class ProfileDrawerViewModel extends BaseModel {
  Landlordperson land = Landlordperson();
  TenantIndividual tent = TenantIndividual();
  void getlandlorddet() async {
    var prefs = locator<PrefsManager>();
    var det = await prefs.getLandLordDetails();
    Landlordperson landlord = Landlordperson.fromJson(jsonDecode(det)["data"]);
    this.land = landlord;
    notifyListeners();
  }

  void gettenantdet() async {
    var prefs = locator<PrefsManager>();
    var det = await prefs.getTenantDetails();
    TenantIndividual tenant =
        TenantIndividual.fromJson(jsonDecode(det)["data"]);
    this.tent = tenant;
    notifyListeners();
  }
}

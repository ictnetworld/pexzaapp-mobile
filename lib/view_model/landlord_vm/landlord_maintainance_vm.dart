import 'package:pexza/api/tenant/request_fix.dart';
import 'package:pexza/models/landlord/maintainance_req_model.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class LandLordMaintainanceViewModel extends BaseModel {
  var maintain = locator<MaintainanceAPI>();
  var prefs = locator<PrefsManager>();
  List<Requests> reqs = List<Requests>();
  List<Requests> manyReqs = List<Requests>();

  Future getFixPerTenant({String id}) async {
    setBusy(true);
    // var id = await prefs.getTenantId();
    var token = await prefs.getLandLordToken();
    var zeFixes =
        await maintain.allFixRequestTenantForLandLord(id: id, token: token);
    this.reqs = zeFixes;
    setBusy(false);
    notifyListeners();
  }
  Future getAllMaintainance()async{
    setBusy(true);
    var token = await prefs.getLandLordToken();
    var zePees = await maintain.allFixRequestsForLandLord(token: token);
    this.manyReqs = zePees;
    print(zePees);
    setBusy(false);
    notifyListeners();
  }
}

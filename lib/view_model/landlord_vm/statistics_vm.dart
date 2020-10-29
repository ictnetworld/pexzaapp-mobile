import 'package:pexza/api/stats_api.dart';
import 'package:pexza/models/landlord/landlord_statistics.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class StatisticsViewModel extends BaseModel{
  var prefs = locator<PrefsManager>();
  Doingwell zewell = Doingwell();
  Future getEmStats()async{
    setBusy(true);
    var token = await prefs.getLandLordToken();
    var well = await StatisticsAPI().landlordstats(token);
    this.zewell = well;
    setBusy(false);
    notifyListeners();
  }
}
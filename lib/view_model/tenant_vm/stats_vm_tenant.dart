import 'package:pexza/api/stats_api.dart';
import 'package:pexza/models/payment_model.dart';
import 'package:pexza/models/tenant/payment_history.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class TenantStatsViewModel extends BaseModel{

  var prefs = locator<PrefsManager>();
  Stats stat = Stats();
  List<History> histo = List<History>();

  Future getPaymentStat()async{
    var token = await prefs.getTenantToken();
    var demstat = await StatisticsAPI().getPaymentStat(token);
    // print(demstat);
    this.stat = demstat;
    print(demstat.lastPayment);
    notifyListeners();
  }
  

  Future getPaymentHistory()async{
    var token = await prefs.getTenantToken();
    var history = await StatisticsAPI().paymentHistory(token);
    this.histo = history;
    notifyListeners();
  }
}
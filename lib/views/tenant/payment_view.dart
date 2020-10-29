import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/payment_model.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';

class Payments extends StatefulWidget {
  final String payment;

  const Payments({Key key, this.payment}) : super(key: key);
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  @override
  Widget build(BuildContext context) {
    final flutterWebviewPlugin = FlutterWebviewPlugin();
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print(url);
    });
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2079A5),
        leading: IconButton(
          icon: Icon(Icons.cancel),
          onPressed: () async {
            await FlutterWebviewPlugin().close();
            await locator<PrefsManager>().sethasPaid(true);
            locator<NavigationService>().navigateToReplacing(TenantLandingView);
          },
        ),
      ),
      url: widget.payment,
      withJavascript: true,
    );
  }
}

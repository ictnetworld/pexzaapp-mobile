import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pexza/util/dialog_manager.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/router.dart';
import 'package:pexza/views/person_select.dart';
import 'package:pexza/views/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    Pexza(),
    //  DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => Pexza())
  );
}

class Pexza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    onstart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("images/Plogo1.png"),
      ),
    );
  }

  onstart() async {
    return Timer(
      Duration(seconds: 3),
      () => locator<NavigationService>().navigateTo(ChooseView),
    );
  }
}

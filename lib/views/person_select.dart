import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';

class Whoami extends StatefulWidget {
  @override
  _WhoamiState createState() => _WhoamiState();
}

class _WhoamiState extends State<Whoami> {
  var prefs = locator<PrefsManager>();
  var nav = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: Text(
                'PEXZA',
                style: GoogleFonts.poppins(
                  fontSize: 60,
                  color: Color(0xff2079A5),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Welcome',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'Choose your account type',
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.height / 35,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () async {
                    var which = await prefs.getlandlordHasLoggedin();
                    print(which);
                    if (which) {
                      nav.navigateTo(LandLordDashView);
                    } else {
                      nav.navigateTo(LandLordSignInView);
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color(0xff2079A5)),
                        child: Center(
                          child: ImageIcon(
                            AssetImage('images/landlord.png'),
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "LandLord",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xff2079A5),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    var which = await prefs.gettenantHasLoggedin();
                    if (which) {
                      nav.navigateTo(TenantLandingView);
                    } else {
                      nav.navigateTo(TenantSignInView);
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color(0xff2079A5),
                        ),
                        child: Center(
                          child: ImageIcon(
                            AssetImage('images/tenant.png'),
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Tenant",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Color(0xff2079A5),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

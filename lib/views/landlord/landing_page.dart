import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/views/landlord/tab_views/addviews/add_apartment.dart';
import 'package:pexza/views/landlord/tab_views/home.dart';
import 'package:pexza/views/landlord/tab_views/maintainace.dart';
import 'package:pexza/views/landlord/tab_views/metrics.dart';
import 'package:pexza/views/landlord/tab_views/view_profile.dart';

class LandLordLanding extends StatefulWidget {
  @override
  _LandLordLandingState createState() => _LandLordLandingState();
}

class _LandLordLandingState extends State<LandLordLanding> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    LandLordHome(),
    LandLordComplaints(),
    LandLordStats(),
    LandLordViewProfile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: LandLordProfileDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.tools), title: Text('Maitainance')),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chartBar), title: Text('Stats')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff2079A5),
        onTap: _onItemTapped,
      ),
    );
  }
}

class LandLordProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nav = locator<NavigationService>();
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Color(0xff2079A5),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Update Profile"),
                        onTap: () => nav.navigateTo(UpdateLandLordProfileView),
                      ),
                      ListTile(
                        leading: Icon(Icons.people),
                        title: Text("Tenants"),
                        onTap: () => nav.navigateTo(AllTenantsView),
                      ),
                      ListTile(
                        leading: FaIcon(FontAwesomeIcons.lock),
                        title: Text("Update Password"),
                        onTap: () => nav.navigateTo(UpdateLandLordPasswordView),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

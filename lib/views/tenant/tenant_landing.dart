import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/drawer_vm.dart';
// import 'package:pexza/models/tenant/tenant_login_model.dart';
// import 'package:pexza/view_model/tenant_vm/tnt_signin_vm.dart';
import 'package:pexza/views/tenant/tab_views_tenant/maintainance_request.dart';
import 'package:pexza/views/tenant/tab_views_tenant/tenant_home.dart';
import 'package:pexza/views/tenant/tab_views_tenant/view_profile.dart';
import 'package:pexza/views/tenant/update_profile.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';
// import 'package:provider_architecture/_viewmodel_provider.dart';

class TenantLanding extends StatefulWidget {
  @override
  _TenantLandingState createState() => _TenantLandingState();
}

class _TenantLandingState extends State<TenantLanding> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    TenantLandingPage(),
    MaintainanceRequest(),
    TenantViewProfile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TenantProfileDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.tools),
            title: Text('Maintianance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff2079A5),
        onTap: _onItemTapped,
      ),
    );
  }
}

class TenantProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nav = locator<NavigationService>();
    return ViewModelProvider<ProfileDrawerViewModel>.withConsumer(
      viewModelBuilder: () => ProfileDrawerViewModel(),
      onModelReady: (model) => model.gettenantdet(),
      builder: (context, model, _) => Drawer(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              color: Color(0xff2079A5),
              child: DrawerHeader(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(model.tent.photo),
                      radius: 35,
                    ),
                    Text(
                      model.tent.fullName,
                      style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      model.tent.email,
                      style: GoogleFonts.comicNeue(color: Colors.white),
                    ),
                    Text(
                      model.tent.userType,
                      style: GoogleFonts.comicNeue(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
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
                          onTap: () => nav.navigateTo(UpdateTenantProfileView),
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.tools),
                          title: Text("Maintenance"),
                          onTap: () => locator<NavigationService>()
                              .navigateTo(MarkFixedView),
                        ),
                        ListTile(
                            leading: FaIcon(FontAwesomeIcons.lock),
                            title: Text("Update Password"),
                            onTap: () =>
                                nav.navigateTo(UpdateTenantPasswordView)),
                        ListTile(
                          leading: Icon(Icons.history),
                          title: Text("Payment History"),
                          onTap: () => nav.navigateTo(PaymentHistoryView),
                        ),
                        // ListTile(
                        //   leading: FaIcon(FontAwesomeIcons.walking),
                        //   title: Text("Pack Out"),
                        // onTap: () => Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Apartments(),
                        //   ),
                        // ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

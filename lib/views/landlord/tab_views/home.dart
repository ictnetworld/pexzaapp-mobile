import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/landlord_vm/home_vm.dart';
import 'package:pexza/views/landlord/tab_views/addviews/add_apartment.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LandLordHome extends StatelessWidget {
  final nav = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewmodel>.withConsumer(
      // disposeViewModel: false,
      viewModelBuilder: () => HomeViewmodel(),
      onModelReady: (model) => model.getUser(),
      builder: (context, model, child) {
        if (model.busy == true) {
          return Center(
            child: SpinKitChasingDots(
              color: Color(0xff2079A5),
              size: 50,
            ),
          );
        } else {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xff2079A5),
                onPressed: () => nav.navigateTo(AddHouseView),
                child: Icon(Icons.add),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: () => Scaffold.of(context).openDrawer(),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sort,
                            color: Color(0xff2079A5),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Welcome, ${model.user.firstName}',
                            style: GoogleFonts.dmSerifText(
                              color: Color(0xff2079A5),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: OwnedHouses(),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class OwnedHouses extends StatelessWidget {
  var nav = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewmodel>.withConsumer(
      onModelReady: (model) => model.getHouses(),
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) => model.houses.length == 0
          ? Center(
              child: Text(
                "You are yet to add houses",
                style: GoogleFonts.poppins(
                  color: Color(0xff2079A5),
                ),
              ),
            )
          : ListView.builder(
              itemCount: model.houses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: model.busy == true
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () => nav.navigateTo(UpdateHouseView,
                              arguments: model.houses[index].id),
                          child: Container(
                            // color: Colors.amber,
                            height: MediaQuery.of(context).size.height / 9,
                            child: Card(
                              child: Center(
                                child: ListTile(
                                  leading: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(204, 25, 25, 25),
                                            Color.fromARGB(102, 44, 44, 44),
                                            Color.fromARGB(153, 25, 25, 25),
                                            Color.fromARGB(51, 44, 44, 44)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter),
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              model.houses[index].photo),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  subtitle: Text("Edit house"),
                                  title:
                                      Text("${model.houses[index].name} House"),
                                  trailing: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Apartments(
                                            data: model.houses[index]),
                                      ),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      decoration: BoxDecoration(
                                          color: Color(0xff2079A5),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "Apartment",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
    );
  }
}

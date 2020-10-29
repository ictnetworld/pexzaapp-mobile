import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/landlord_vm/statistics_vm.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LandLordStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StatisticsViewModel>.withConsumer(
      viewModelBuilder: () => StatisticsViewModel(),
      onModelReady: (model) => model.getEmStats(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Your Stats",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: model.busy == true ? SpinKitChasingDots(size: 50, color: Color(0xff2079A5),) : Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2079A5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("images/complain.png"),
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Complaints",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            model.zewell.complains.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2079A5),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("images/tenant.png"),
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Tenants",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            model.zewell.tenants.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2079A5),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("images/apartment.png"),
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Apartments",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            model.zewell.apartments.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff2079A5),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage("images/house.png"),
                            color: Colors.white,
                            size: 60,
                          ),
                          Text(
                            "Houses",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            model.zewell.house.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/landlord_vm/landlord_maintainance_vm.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LandLordComplaints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LandLordMaintainanceViewModel>.withConsumer(
      disposeViewModel: false,
      viewModelBuilder: () => LandLordMaintainanceViewModel(),
      onModelReady: (model) => model.getAllMaintainance(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.replay,
                color: Color(0xff2079A5),
              ),
              onPressed: () => model.getAllMaintainance(),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Maintenance",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: model.busy == true
              ? SpinKitChasingDots(
                  color: Color(0xff2079A5),
                  size: 40,
                )
              : model.manyReqs.length == 0
                  ? Center(
                      child: Text(
                        "You have maintenance request yet",
                        style: GoogleFonts.poppins(
                          color: Color(0xff2079A5),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: model.manyReqs.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Card(
                          child: ListTile(
                            title: Text(model.manyReqs[index].duty),
                            subtitle:
                                Text(model.manyReqs[index].tenant.firstName),
                            trailing: Text(model.manyReqs[index].level),
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}

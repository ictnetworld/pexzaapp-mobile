import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/landlord_vm/get_them_vm.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class AllTenants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<GetThemViewModel>.withConsumer(
      viewModelBuilder: () => GetThemViewModel(),
      onModelReady: (model) => model.getAllTenants(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Tenants",
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: model.busy == true
            ? SpinKitChasingDots(
                color: Color(0xff2079A5),
                size: 30,
              )
            : ListView.builder(
                itemCount: model.mepeep.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(model.mepeep[index].photo),
                      ),
                      title: Text(model.mepeep[index].fullName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.mepeep[index].assignment.apartment.name),
                          SizedBox(height: 5,),
                          Text(model.mepeep[index].phone)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

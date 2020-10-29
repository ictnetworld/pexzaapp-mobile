import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/tenant_vm/tenant_maintainance_vm.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class MarkFixed extends StatelessWidget {
  // final List<Req> req;

  // const MarkFixed({Key key, this.req}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenenantMaintainanceViewModel>.withConsumer(
      viewModelBuilder: () => TenenantMaintainanceViewModel(),
      onModelReady: (model) => model.allRequests(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.replay,
                color: Color(0xff2079A5),
              ),
              onPressed: () => model.allRequests(),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "All Fix Requests",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ListView.builder(
              itemCount: model.req.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // print("hian");
                  if (model.req[index].isFixed == "1") {
                    model.setUnFixed(id: model.req[index].id.toString());
                  }
                  if (model.req[index].isFixed == "0") {
                    model.setFixed(id: model.req[index].id.toString());
                  }
                },
                child: Card(
                  color: model.req[index].isFixed == "1"
                      ? Colors.green
                      : Colors.red,
                  child: ListTile(
                    title: Text(model.req[index].duty),
                    subtitle: Text(model.req[index].level),
                    trailing: Text(
                        model.req[index].isFixed == "1" ? "Fixed" : "Unfixed"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

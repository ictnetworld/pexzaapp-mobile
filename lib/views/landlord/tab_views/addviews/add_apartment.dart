import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/landlord/own_houses.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/landlord_vm/home_vm.dart';
import 'package:pexza/views/landlord/add_tenant.dart';
import 'package:pexza/views/landlord/tab_views/addviews/update_apartment.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class Apartments extends StatefulWidget {
  final Data data;

  const Apartments({Key key, this.data}) : super(key: key);

  @override
  _ApartmentsState createState() => _ApartmentsState();
}

class _ApartmentsState extends State<Apartments> {
  var nav = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewmodel>.withConsumer(
      viewModelBuilder: () => HomeViewmodel(),
      onModelReady: (model) => model.getApartments(widget.data.id.toString()),
      builder: (context, model, _) {
        if (model.busy == true) {
          return Scaffold(
            body: Center(
              child: SpinKitChasingDots(
                color: Color(0xff2079A5),
                size: 50,
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.replay, color: Color(0xff2079A5),),
                  onPressed: () =>
                      model.getApartments(widget.data.id.toString()),
                )
              ],
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                widget.data.name,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Color(0xff2079A5),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff2079A5),
              onPressed: () {
                showModalBottomSheet(
                  // isScrollControlled: true,
                  context: context,
                  builder: (context) => AddApartment(
                    id: widget.data.id.toString(),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
            body: Padding(
              padding:
                  EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 20),
              child: Column(
                children: [
                  // Text(
                  //   "Tap on apartment to add tenant to it",
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 14,
                  //     color: Color(0xff2079A5),
                  //   ),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.apartment.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                UpdateApartment(id: model.apartment[index].id),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(model.apartment[index].name),
                            subtitle: Text("Edit Apartment"),
                            trailing: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTenant(
                                    apartment: model.apartment[index],
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xff2079A5),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("   Add"),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              150,
                                    ),
                                    Text("   Tenant")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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

class AddApartment extends StatefulWidget {
  final String id;

  AddApartment({Key key, this.id}) : super(key: key);

  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  final nameController = TextEditingController();

  final typeController = TextEditingController();

  final descriptionController = TextEditingController();
  final _apartmentformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewmodel>.withConsumer(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 30),
            child: Form(
              key: _apartmentformKey,
              child: ListView(
                children: [
                  InfoField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      }
                    },
                    controller: nameController,
                    placeholder: "Apartment Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InfoField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      }
                    },
                    controller: typeController,
                    placeholder: "Apartment Type",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InfoField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      }
                    },
                    controller: descriptionController,
                    placeholder: "Description",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 220, right: 5.0),
                    child: AllRoundButton(
                      busy: model.busy,
                      placeholder: "Add",
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width,
                      buttonColor: Color(0xff2079A5),
                      textColor: Colors.white,
                      onTap: () async {
                        print(widget.id);
                        if (_apartmentformKey.currentState.validate()) {
                          await model.addApartment(
                            id: widget.id,
                            name: nameController.text,
                            type: typeController.text,
                            description: descriptionController.text,
                          );
                          nameController.clear();
                          typeController.clear();
                          descriptionController.clear();
                          locator<NavigationService>().pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

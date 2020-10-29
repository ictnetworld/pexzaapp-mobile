import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/landlord_vm/home_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class AddHouse extends StatelessWidget {
  final propertyTypeController = TextEditingController();
  final propertyNameController = TextEditingController();
  final houseTypeController = TextEditingController();
  final streetNameController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final _houseformkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewmodel>.withConsumer(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, _) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _houseformkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: propertyNameController,
                  placeholder: "Property Name",
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: propertyTypeController,
                  placeholder: "Property Type",
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: houseTypeController,
                  placeholder: "Select House Type",
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: streetNameController,
                  placeholder: "Street Name",
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: cityController,
                  placeholder: "Town/City",
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: stateController,
                  placeholder: "State",
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    }
                  },
                  controller: countryController,
                  placeholder: "Country",
                ),
                SizedBox(
                  height: 10,
                ),
                model.pickedImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () => model.takeImage(),
                              ),
                              IconButton(
                                icon: Icon(Icons.photo),
                                onPressed: () => model.pickImage(),
                              )
                            ],
                          ),
                          Text(
                            "Pick House Image",
                            style: GoogleFonts.poppins(
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: FileImage(model.pickedImage),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                SizedBox(
                  height: 50,
                ),
                AllRoundButton(
                  busy: model.busy,
                  buttonColor: Color(0xff2079A5),
                  textColor: Colors.white,
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 2,
                  placeholder: "Add House",
                  onTap: () {
                    if (_houseformkey.currentState.validate()) {
                      model.addAHouse(
                        propertyName: propertyNameController.text,
                        propertyType: propertyTypeController.text,
                        houseType: houseTypeController.text,
                        streetName: streetNameController.text,
                        city: cityController.text,
                        state: stateController.text,
                        country: countryController.text,
                        houseImg: model.pickedImage.path
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/landlord_vm/home_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class UpdateApartment extends StatefulWidget {
  final int id;

  UpdateApartment({Key key, this.id}) : super(key: key);

  @override
  _UpdateApartmentState createState() => _UpdateApartmentState();
}

class _UpdateApartmentState extends State<UpdateApartment> {
  final nameController = TextEditingController();

  final typeController = TextEditingController();

  final descriptionController = TextEditingController();
  // final _updateapartmentformKey = GlobalKey<FormState>();

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
              // key: _apartmentformKey,
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
                    padding: const EdgeInsets.only(left: 170, right: 5.0),
                    child: AllRoundButton(
                      busy: model.busy,
                      placeholder: "Update",
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width,
                      buttonColor: Color(0xff2079A5),
                      textColor: Colors.white,
                      onTap: () async {
                        await model.updateApartment(
                          id: widget.id.toString(),
                          name: nameController.text,
                          type: typeController.text,
                          description: descriptionController.text,
                        );
                        nameController.clear();
                        typeController.clear();
                        descriptionController.clear();
                        locator<NavigationService>().pop();
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

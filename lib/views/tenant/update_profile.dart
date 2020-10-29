import 'dart:convert';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/models/tenant/tenant_login_model.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/update_profile_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class UpdateTenantProfile extends StatefulWidget {
  @override
  _UpdateTenantProfileState createState() => _UpdateTenantProfileState();
}

class _UpdateTenantProfileState extends State<UpdateTenantProfile> {
  var prefs = locator<PrefsManager>();
  final _updateTenantFormKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneNumberNode = FocusNode();
  final emailNode = FocusNode();
  final firstnameNode = FocusNode();
  final lastnameNode = FocusNode();
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UpdateProfileViewModel>.withConsumer(
      viewModelBuilder: () => UpdateProfileViewModel(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Update Profile",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: Form(
          key: _updateTenantFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Card(
                    child: Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 8),
                          CircleAvatar(
                            radius: 50,
                            child: model.pickedImage == null
                                ? Image.network(
                                    "https://res.cloudinary.com/pexzaapp/image/upload/v1602017188/15f7cd7a3a5ca1_1602017187.jpg.jpg",
                                    fit: BoxFit.fill,
                                  )
                                : Container(
                                    height: 122,
                                    width: 122,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      image: DecorationImage(
                                          image: FileImage(
                                            model.pickedImage,
                                          ),
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {
                                  model.takeImage();
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.photo),
                                onPressed: () {
                                  model.pickImage();
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InfoField(
                        inputAction: TextInputAction.next,
                        focusNode: firstnameNode,
                        onSubmitted: (term) {
                          _fieldFocusChange(
                              context, firstnameNode, lastnameNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Input your firstname";
                          }
                          return null;
                        },
                        controller: firstnameController,
                        placeholder: 'Firstname',
                        inputType: TextInputType.name,
                        // obscure: true,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InfoField(
                        inputAction: TextInputAction.next,
                        focusNode: lastnameNode,
                        onSubmitted: (term) {
                          _fieldFocusChange(context, lastnameNode, emailNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Input your lastname";
                          }
                          return null;
                        },
                        controller: lastnameController,
                        placeholder: 'Lastname',
                        inputType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: InfoField(
                  inputAction: TextInputAction.next,
                  focusNode: emailNode,
                  onSubmitted: (term) {
                    _fieldFocusChange(context, emailNode, phoneNumberNode);
                  },
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return "Input a valid email";
                    } else if (value.isEmpty) {
                      return "Insert an E-mail";
                    }
                    return null;
                  },
                  controller: emailController,
                  placeholder: 'E-Mail',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: SizedBox(
                          width: 75.0,
                          child: Center(
                            child: Stack(
                              children: [
                                CountryCodePicker(
                                  initialSelection: '+234',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InfoField(
                        inputAction: TextInputAction.done,
                        focusNode: phoneNumberNode,
                        inputType: TextInputType.phone,
                        validator: (value) {
                          if (value.length < 10) {
                            return "Number is incomplete";
                          } else if (value.length > 10) {
                            return "Number is excess";
                          } else if (value.length == 10) {
                            return null;
                          }
                        },
                        controller: phoneNumberController,
                        placeholder: 'XXXX-XXXX-XXXX',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: AllRoundButton(
                  busy: model.busy,
                  fontWeight: FontWeight.w500,
                  height: MediaQuery.of(context).size.height / 15,
                  width: 200,
                  placeholder: 'Update',
                  onTap: () async {
                    var det = await prefs.getTenantDetails();
                    TenantIndividual tenant =
                        TenantIndividual.fromJson(jsonDecode(det)["data"]);
                    if (model.pickedImage == null) {
                      await model.updateProfileTenant(
                        phoneNumber: phoneNumberController.text == null
                            ? tenant.phone
                            : phoneNumberController.text,
                        email: emailController.text == null
                            ? tenant.email
                            : emailController.text,
                        lastname: lastnameController.text == null
                            ? tenant.lastName
                            : lastnameController.text,
                        firstname: firstnameController.text == null
                            ? tenant.firstName
                            : firstnameController.text,
                        // profileImage: model.pickedImage.path == null
                        //     ? null
                        //     : model.pickedImage.path,
                      );
                    } else {
                      model.updateProfileTenant(
                        phoneNumber: phoneNumberController.text == null
                            ? tenant.phone
                            : "0"+phoneNumberController.text,
                        email: emailController.text == null
                            ? tenant.email
                            : emailController.text,
                        lastname: lastnameController.text == null
                            ? tenant.lastName
                            : lastnameController.text,
                        firstname: firstnameController.text == null
                            ? tenant.firstName
                            : firstnameController.text,
                        profileImage: model.pickedImage.path,
                      );
                    }
                    phoneNumberController.clear();
                    emailController.clear();
                    lastnameController.clear();
                    firstnameController.clear();
                  },
                  textColor: Colors.white,
                  buttonColor: Color(0xff2079A5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}

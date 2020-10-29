import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/landlord_vm/lnld_signup_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LandLordSignUp extends StatefulWidget {
  @override
  _LandLordSignUpState createState() => _LandLordSignUpState();
}

class _LandLordSignUpState extends State<LandLordSignUp> {
  final _landlordsignupformKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  String _genderController;
  final ageController = TextEditingController();
  final passwordNode = FocusNode();
  final phoneNumberNode = FocusNode();
  final emailNode = FocusNode();
  final firstnameNode = FocusNode();
  final lastnameNode = FocusNode();
  final genderNode = FocusNode();
  final ageNode = FocusNode();
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LandLordSignUpViewModel>.withConsumer(
      viewModelBuilder: () => LandLordSignUpViewModel(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _landlordsignupformKey,
          child: ListView(
            children: [
              SizedBox(height: 70),
              Center(
                child: Image.asset("images/Plogo1.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'LANDLORD REGISTER',
                  style: TextStyle(
                    color: Color(0xff2079A5),
                    fontSize: MediaQuery.of(context).size.height / 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                        inputType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Input your firstname";
                          }
                          return null;
                        },
                        controller: firstnameController,
                        placeholder: 'Firstname',
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
                        inputType: TextInputType.name,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Input your lastname";
                          }
                          return null;
                        },
                        controller: lastnameController,
                        placeholder: 'Lastname',
                        // obscure: true,
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
                        inputAction: TextInputAction.next,
                        focusNode: phoneNumberNode,
                        onSubmitted: (term) {
                          _fieldFocusChange(
                              context, phoneNumberNode, passwordNode);
                        },
                        inputType: TextInputType.number,
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: InfoField(
                  inputAction: TextInputAction.done,
                  focusNode: passwordNode,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Input a password";
                    } else if (value.length < 8) {
                      return "Password must be 8 characters long";
                    }
                    return null;
                  },
                  obscure: true,
                  controller: passwordController,
                  placeholder: 'Password',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButtonFormField(
                        focusNode: genderNode,
                        validator: (value) {
                          if (value == null) {
                            return "Choose gender";
                          }
                          return null;
                        },
                        value: _genderController,
                        hint: Text("Choose gender"),
                        items: [
                          DropdownMenuItem(
                            child: Text('Male'),
                            value: "Male",
                          ),
                          DropdownMenuItem(
                            child: Text('Female'),
                            value: "Female",
                          ),
                          // DropdownMenuItem(child: Text(''),),
                        ],
                        onChanged: (value) {
                          // setState(() {
                          _genderController = value;
                          // });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: InfoField(
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.done,
                        focusNode: ageNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Age field cannot be empty";
                          }
                          if (value.length > 3) {
                            return "Age can't be more than 3";
                          }
                          if (num.tryParse(value) == null) {
                            return "Must be a number";
                          }
                          return null;
                        },
                        // obscure: password,
                        controller: ageController,
                        placeholder: 'Age',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: AllRoundButton(
                  busy: model.busy,
                  fontWeight: FontWeight.w500,
                  height: 60,
                  width: 200,
                  placeholder: 'Register',
                  onTap: () async {
                    if (_landlordsignupformKey.currentState.validate()) {
                      await model.signup(
                          phoneNumber: phoneNumberController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          firstname: firstnameController.text,
                          lastname: lastnameController.text,
                          age: ageController.text,
                          gender: _genderController);
                      phoneNumberController.clear();
                      emailController.clear();
                      passwordController.clear();
                      firstnameController.clear();
                      lastnameController.clear();
                      ageController.clear();
                    }
                  },
                  textColor: Colors.white,
                  buttonColor: Color(0xff2079A5),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 25),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff2079A5),
                          fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              locator<NavigationService>()
                                  .navigateTo(LandLordSignInView);
                            },
                          text: 'Log In',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2079A5),
                          ),
                        ),
                      ],
                    ),
                  ),
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

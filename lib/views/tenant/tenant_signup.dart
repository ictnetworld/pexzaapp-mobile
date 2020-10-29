import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/tenant_vm/tnt_signup_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class TenantSignup extends StatefulWidget {
  @override
  _TenantSignupState createState() => _TenantSignupState();
}

class _TenantSignupState extends State<TenantSignup> {
  @override
  Widget build(BuildContext context) {
    final _tenantsignupformKey = GlobalKey<FormState>();
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
    bool password = true;
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return ViewModelProvider<TenantSignUpViewModel>.withConsumer(
      viewModelBuilder: () => TenantSignUpViewModel(),
      builder: (context, model, _) => Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _tenantsignupformKey,
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
                  'TENANT REGISTER',
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
                        inputAction: TextInputAction.next,
                        focusNode: phoneNumberNode,
                        onSubmitted: (term) {
                          _fieldFocusChange(
                              context, phoneNumberNode, passwordNode);
                        },
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
                  obscure: password,
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
                          _genderController = value;
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
                    if (_tenantsignupformKey.currentState.validate()) {
                      await model.signup(
                          phoneNumber: phoneNumberController.text,
                          password: passwordController.text,
                          email: emailController.text,
                          lastname: lastnameController.text,
                          firstname: firstnameController.text,
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
                                  .navigateTo(TenantSignInView);
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

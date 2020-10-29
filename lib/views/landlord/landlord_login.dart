import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/landlord_vm/lnld_signin_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/clickable_text.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class LandLordLogin extends StatefulWidget {
  @override
  _LandLordLoginState createState() => _LandLordLoginState();
}

class _LandLordLoginState extends State<LandLordLogin> {
  final _landlordloginformKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordNode = FocusNode();
  final phoneNode = FocusNode();
  var nav = locator<NavigationService>();
  Pattern pattern = r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LandLordSignInViewModel>.withConsumer(
      viewModelBuilder: () => LandLordSignInViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Form(
          key: _landlordloginformKey,
          child: ListView(
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                child: Image.asset("images/Plogo1.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'LANDLORD LOGIN',
                  style: TextStyle(
                    color: Color(0xff2079A5),
                    fontSize: MediaQuery.of(context).size.height / 30,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
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
                          focusNode: phoneNode,
                          onSubmitted: (term) {
                            _fieldFocusChange(context, phoneNode, passwordNode);
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
                            if (value.isEmpty) {
                              return "Field should not be empty";
                            }
                          },
                          controller: phoneNumberController,
                          placeholder: 'XXXX-XXXX-XXXX',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: InfoField(
                  focusNode: passwordNode,
                  inputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insert a Password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  placeholder: 'Password',
                  obscure: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: AllRoundButton(
                  busy: model.busy,
                  fontWeight: FontWeight.w500,
                  height: 60,
                  width: 200,
                  placeholder: 'Login',
                  onTap: () {
                    if (_landlordloginformKey.currentState.validate()) {
                      model.signin(
                          phoneNumber: phoneNumberController.text,
                          password: passwordController.text);
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
                child: ClickText(
                  text: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xff2079A5),
                    ),
                  ),
                  onTap: () =>
                      nav.navigateTo(EmailFieldForPasswordResetViewLand),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 25),
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff2079A5),
                          fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              locator<NavigationService>()
                                  .navigateTo(LandLordSignUpView);
                            },
                          text: 'Sign Up',
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pexza/view_model/forgot_password_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class PasswordResetLand extends StatefulWidget {
  @override
  _PasswordResetLandState createState() => _PasswordResetLandState();
}

class _PasswordResetLandState extends State<PasswordResetLand> {
  String _otp = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Form(
                child: OTPTextField(
                  fieldStyle: FieldStyle.box,
                  keyboardType: TextInputType.text,
                  length: 4,
                  fieldWidth: 40,
                  width: (MediaQuery.of(context).size.width - 100),
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2F444F),
                  ),
                  onChanged: (v) => {
                    setState(() {
                      _otp = v;
                    })
                  },
                  onCompleted: (v) => {
                    setState(() {
                      _otp = v;
                    })
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            AllRoundButton(
              busy: model.busy,
              fontWeight: FontWeight.w500,
              height: 50,
              width: 200,
              placeholder: 'Confirm',
              onTap: () {
                if (_otp.length == 4) {
                  model.verifyLand(code: _otp);
                } else {
                  model.onOTPField();
                }
              },
              textColor: Colors.white,
              buttonColor: Color(0xff2079A5),
            )
          ],
        ),
      ),
    );
  }
}

class EmailFieldForPasswordResetLand extends StatelessWidget {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InfoField(
                    inputType: TextInputType.emailAddress,
                    controller: emailController,
                    placeholder: "Input Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AllRoundButton(
                  textColor: Colors.white,
                  buttonColor: Color(0xff2079A5),
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 2,
                  placeholder: "Send",
                  onTap: () =>
                      model.requestResetLand(email: emailController.text),
                  busy: model.busy,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordLand extends StatefulWidget {
  @override
  _ResetPasswordLandState createState() => _ResetPasswordLandState();
}

class _ResetPasswordLandState extends State<ResetPasswordLand> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _resetPasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Form(
          key: _resetPasswordKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 120),
                InfoField(
                  obscure: true,
                  controller: passwordController,
                  placeholder: "Password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field cannot be empty";
                    }
                  },
                ),
                SizedBox(height: 15),
                InfoField(
                  obscure: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field cannot be empty";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                  },
                  controller: confirmPasswordController,
                  placeholder: "Confirm Password",
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: AllRoundButton(
                    busy: model.busy,
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width,
                    placeholder: 'Reset',
                    textColor: Colors.white,
                    buttonColor: Color(0xff2079A5),
                    onTap: () {
                      if (_resetPasswordKey.currentState.validate()) {
                        model.setNewPasswordLand(
                            password: passwordController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordResetTenannt extends StatefulWidget {
  @override
  _PasswordResetTenanntState createState() => _PasswordResetTenanntState();
}

class _PasswordResetTenanntState extends State<PasswordResetTenannt> {
  String _otp = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Input the OTP sent to your mail here",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xff2079A5),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Form(
                child: OTPTextField(
                  fieldStyle: FieldStyle.box,
                  keyboardType: TextInputType.text,
                  length: 4,
                  fieldWidth: 40,
                  width: (MediaQuery.of(context).size.width - 100),
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2F444F),
                  ),
                  onChanged: (v) => {
                    setState(() {
                      _otp = v;
                    })
                  },
                  onCompleted: (v) => {
                    setState(() {
                      _otp = v;
                    })
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            AllRoundButton(
              busy: model.busy,
              fontWeight: FontWeight.w500,
              height: 50,
              width: 200,
              placeholder: 'Confirm',
              onTap: () {
                if (_otp.length == 4) {
                  model.verify(code: _otp);
                } else {
                  model.onOTPField();
                }
              },
              textColor: Colors.white,
              buttonColor: Color(0xff2079A5),
            )
          ],
        ),
      ),
    );
  }
}

class EmailFieldForPasswordResetTenant extends StatelessWidget {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InfoField(
                    inputType: TextInputType.emailAddress,
                    controller: emailController,
                    placeholder: "Input Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AllRoundButton(
                  textColor: Colors.white,
                  buttonColor: Color(0xff2079A5),
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 2,
                  placeholder: "Send",
                  onTap: () =>
                      model.requestResetTenant(email: emailController.text),
                  busy: model.busy,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordTenant extends StatefulWidget {
  @override
  _ResetPasswordTenantState createState() => _ResetPasswordTenantState();
}

class _ResetPasswordTenantState extends State<ResetPasswordTenant> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _resetPasswordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Form(
          key: _resetPasswordKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 120),
                InfoField(
                  obscure: true,
                  controller: passwordController,
                  placeholder: "Password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field cannot be empty";
                    }
                  },
                ),
                SizedBox(height: 15),
                InfoField(
                  obscure: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field cannot be empty";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                  },
                  controller: confirmPasswordController,
                  placeholder: "Confirm Password",
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: AllRoundButton(
                    busy: model.busy,
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width,
                    placeholder: 'Reset',
                    textColor: Colors.white,
                    buttonColor: Color(0xff2079A5),
                    onTap: () {
                      if (_resetPasswordKey.currentState.validate()) {
                        model.setNewPassword(password: passwordController.text);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

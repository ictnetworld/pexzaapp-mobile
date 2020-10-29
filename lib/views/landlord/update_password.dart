import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/forgot_password_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class UpdateLandLordPassword extends StatefulWidget {
  @override
  _UpdateLandLordPasswordState createState() => _UpdateLandLordPasswordState();
}

class _UpdateLandLordPasswordState extends State<UpdateLandLordPassword> {
  final _updatelandlordPasswordkey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final oldpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ResetPasswordViewModel>.withConsumer(
      viewModelBuilder: () => ResetPasswordViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Update Password",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: Form(
          key: _updatelandlordPasswordkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 80,),
                InfoField(
                  obscure: true,
                  controller: oldpasswordController,
                  placeholder: "Old-Password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    } else if (value.length < 8) {
                      return "Password must be 8 characters long";
                    }
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                InfoField(
                  obscure: true,
                  controller: newPasswordController,
                  placeholder: "New-Password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field Cannot be empty";
                    } else if (value.length < 8) {
                      return "Password must be 8 characters long";
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                AllRoundButton(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 2,
                  textColor: Colors.white,
                  buttonColor: Color(0xff2079A5),
                  placeholder: "Update",
                  busy: model.busy,
                  onTap: () async {
                    if (_updatelandlordPasswordkey.currentState.validate()) {
                      await model.updateLandLordPassword(
                        oldPassword: oldpasswordController.text,
                        newPassword: newPasswordController.text,
                      );
                      oldpasswordController.clear();
                      newPasswordController.clear();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

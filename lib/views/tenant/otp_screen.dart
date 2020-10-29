import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pexza/view_model/tenant_vm/confirm_agreement_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class ConfirmLandLord extends StatefulWidget {
  @override
  _ConfirmLandLordState createState() => _ConfirmLandLordState();
}

class _ConfirmLandLordState extends State<ConfirmLandLord> {
  String _otp = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ConfirmAgreementViewModel>.withConsumer(
      viewModelBuilder: () => ConfirmAgreementViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("images/Plogo1.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Check your mail for an OTP from your landlord.\n Contact your landlord if you don't see any",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xff2079A5),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
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
                    model.confirmTerms(code: _otp);
                  } else {
                    model.onOtpIncomplete();
                  }
                },
                textColor: Colors.white,
                buttonColor: Color(0xff2079A5),
              )
            ],
          ),
        ),
      ),
    );
  }
}

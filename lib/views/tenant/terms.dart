import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/tenant_vm/confirm_agreement_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class AgreeTerms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ConfirmAgreementViewModel>.withConsumer(
      onModelReady: (model) => model.getDetail(),
      viewModelBuilder: () => ConfirmAgreementViewModel(),
      builder: (context, model, _) {
        if (model.agree.amount == null) {
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
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                "Agreement",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Color(0xff2079A5),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Rent Duration(in months)',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      subtitle: Text(
                        model.agree.duration,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Rate(per month)',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      subtitle: Text(
                        model.agree.amount,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Total Rent',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      subtitle: Text(
                        "${int.parse(model.agree.duration) * int.parse(model.agree.amount)}",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Payment Plan',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      subtitle: Text(
                        "${model.agree.paymentPlan.toUpperCase()}",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Apartment',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      subtitle: Text(
                        "${model.agree.apartment.name}",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AllRoundButton(
                    busy: model.busy,
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width,
                    placeholder: model.agree.currency.toUpperCase() == "USD"
                        ? "Paypal"
                        : "Paystack",
                    buttonColor: Color(0xff2079A5),
                    textColor: Colors.white,
                    onTap: () {
                      if (model.agree.currency.toUpperCase() != "USD") {
                        model.pay(
                            amount: model.agree.amount,
                            currency: model.agree.currency.toUpperCase(),
                            duration: model.agree.duration);
                      } else {
                        // print("touched");
                        model.paypal(
                            amount: model.agree.amount,
                            currency: model.agree.currency.toUpperCase(),
                            duration: model.agree.duration);
                      }
                    },
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

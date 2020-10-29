import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/models/landlord/apartments.dart';
import 'package:pexza/view_model/landlord_vm/create_tenant.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class AddTenant extends StatefulWidget {
  final Apartment apartment;

  const AddTenant({Key key, this.apartment}) : super(key: key);
  @override
  _AddTenantState createState() => _AddTenantState();
}

class _AddTenantState extends State<AddTenant> {
  final emailController = TextEditingController();
  String _payPlanController;
  final durationController = TextEditingController();
  String _currencyController;
  final amountController = TextEditingController();
  final _addtenantformKey = GlobalKey<FormState>();
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<CreateTenantViewModel>.withConsumer(
      viewModelBuilder: () => CreateTenantViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Add Tenant to ${widget.apartment.name}",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
            key: _addtenantformKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                InfoField(
                  placeholder: "Tenant Email",
                  controller: emailController,
                  validator: (value) {
                    RegExp regExp = RegExp(pattern);
                    if (regExp.hasMatch(value)) {
                      return null;
                    } else if (value.isEmpty) {
                      return "Insert an E-mail";
                    }
                    // else if(!regExp.hasMatch(value)){
                    //   return "Use a valid email";
                    // }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please select a Payment Plan";
                    }
                    return null;
                  },
                  value: _payPlanController,
                  hint: Text("Payment Plan"),
                  items: [
                    DropdownMenuItem(
                      child: Text('Monthly'),
                      value: "Monthly",
                    ),
                    DropdownMenuItem(
                      child: Text('Yearly'),
                      value: "Yearly",
                    ),
                    // DropdownMenuItem(child: Text(''),),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _payPlanController = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                    inputType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Field should not be empty";
                      }
                    },
                    placeholder: "Duration",
                    controller: durationController),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Please select a Currency";
                    }
                    return null;
                  },
                  value: _currencyController,
                  hint: Text("Currency"),
                  items: [
                    DropdownMenuItem(
                      child: Text('USD'),
                      value: "USD",
                    ),
                    DropdownMenuItem(
                      child: Text('NGN'),
                      value: "NGN",
                    ),
                    // DropdownMenuItem(child: Text(''),),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _currencyController = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                InfoField(
                    inputType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Field should not be empty";
                      }
                    },
                    placeholder: "Amount",
                    controller: amountController),
                SizedBox(
                  height: 30,
                ),
                AllRoundButton(
                    busy: model.busy,
                    onTap: () async {
                      if (_addtenantformKey.currentState.validate()) {
                        await model.addTenant(
                          id: widget.apartment.id.toString(),
                          amount: amountController.text,
                          payPlan: _payPlanController.toLowerCase(),
                          duration: durationController.text,
                          currency: _currencyController,
                          email: emailController.text,
                        );
                        amountController.clear();
                        durationController.clear();
                        // _currencyController.;
                        emailController.clear();
                      }
                    },
                    textColor: Colors.white,
                    buttonColor: Color(0xff2079A5),
                    placeholder: "Add",
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

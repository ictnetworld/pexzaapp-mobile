import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/tenant_vm/tenant_maintainance_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/text_field.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class MaintainanceRequest extends StatefulWidget {
  @override
  _MaintainanceRequestState createState() => _MaintainanceRequestState();
}

class _MaintainanceRequestState extends State<MaintainanceRequest> {
  final _maintainanceFormKey = GlobalKey<FormState>();
  final dutyController = TextEditingController();
  var _severityvalue;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenenantMaintainanceViewModel>.withConsumer(
      viewModelBuilder: () => TenenantMaintainanceViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Maintenance",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: Form(
          key: _maintainanceFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: InfoField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Field cannot be empty";
                    }
                  },
                  controller: dutyController,
                  placeholder: "What needs Fixing",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButtonFormField(
                  hint: Text("Severity"),
                  validator: (value) {
                    if (value == null) {
                      return "Please select a severity";
                    }
                    return null;
                  },
                  value: _severityvalue,
                  items: [
                    DropdownMenuItem(
                      child: Text('Low'),
                      value: "Low",
                    ),
                    DropdownMenuItem(
                      child: Text('Medium'),
                      value: "Medium",
                    ),
                    DropdownMenuItem(
                      child: Text('High'),
                      value: "High",
                    ),
                  ],
                  onChanged: (value) {
                    // setState(() {
                    _severityvalue = value;
                    // });
                  },
                  isExpanded: true,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: AllRoundButton(
                  height: MediaQuery.of(context).size.height / 15,
                  placeholder: "Request Fix",
                  onTap: () async {
                    if (_maintainanceFormKey.currentState.validate()) {
                      await model.fixRequest(
                        duty: dutyController.text,
                        level: _severityvalue,
                      );
                      dutyController.clear();
                    }
                  },
                  width: MediaQuery.of(context).size.width,
                  textColor: Colors.white,
                  busy: model.busy,
                  buttonColor: Color(0xff2079A5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

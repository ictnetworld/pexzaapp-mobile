import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/view_model/tenant_vm/stats_vm_tenant.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class PaymentHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenantStatsViewModel>.withConsumer(
      onModelReady: (model) => model.getPaymentHistory(),
      viewModelBuilder: () => TenantStatsViewModel(),
      builder: (context, model, _) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.replay,
                color: Color(0xff2079A5),
              ),
              onPressed: () => model.getPaymentHistory(),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Payment History",
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Color(0xff2079A5),
            ),
          ),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Amount paid: ${model.histo[index].amount}"),
                      subtitle: Text(
                          "Duration of rent: ${model.histo[index].duration} months"),
                    ),
                  ),
                ),
            itemCount: model.histo.length),
      ),
    );
  }
}

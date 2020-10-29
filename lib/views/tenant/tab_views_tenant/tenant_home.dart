import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/tenant_vm/confirm_agreement_vm.dart';
import 'package:pexza/view_model/tenant_vm/stats_vm_tenant.dart';
import 'package:pexza/view_model/tenant_vm/tenant_maintainance_vm.dart';
import 'package:pexza/view_model/tenant_vm/tnt_signin_vm.dart';
import 'package:pexza/views/widgets/button.dart';
import 'package:pexza/views/widgets/clickable_text.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class TenantLandingPage extends StatefulWidget {
  @override
  _TenantLandingPageState createState() => _TenantLandingPageState();
}

class _TenantLandingPageState extends State<TenantLandingPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenantSigninViewModel>.withConsumer(
      viewModelBuilder: () => TenantSigninViewModel(),
      onModelReady: (model) => model.getUser(),
      builder: (context, model, _) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: model.user.email == null
                ? Center(
                    child: SpinKitChasingDots(
                      color: Color(0xff2079A5),
                      size: 50,
                    ),
                  )
                : ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Row(
                            children: [
                              Icon(
                                Icons.sort,
                                color: Color(0xff2079A5),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Welcome, ${model.user.firstName}",
                                style: GoogleFonts.dmSerifText(
                                  fontSize: 20,
                                  color: Color(0xff2079A5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          "House Details",
                          style: GoogleFonts.dmSerifText(
                            fontSize: 12,
                            color: Color(0xff2079A5),
                          ),
                        ),
                      ),
                      HouseCard(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 8),
                        child: Text(
                          "Maintainance Status",
                          style: GoogleFonts.dmSerifText(
                            fontSize: 12,
                            color: Color(0xff2079A5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Maintainance(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 8),
                        child: Text(
                          "Your Stats",
                          style: GoogleFonts.dmSerifText(
                            fontSize: 12,
                            color: Color(0xff2079A5),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: PaymentStatistics(),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class HouseCard extends StatefulWidget {
  @override
  _HouseCardState createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ConfirmAgreementViewModel>.withConsumer(
      onModelReady: (model) => model.getDetail(),
      disposeViewModel: false,
      viewModelBuilder: () => ConfirmAgreementViewModel(),
      builder: (context, model, _) => model.busy == true
          ? SpinKitSpinningCircle(
              color: Color(0xff2079A5),
              size: 40,
            )
          : model.agree == null
              ? GestureDetector(
                  onTap: () {
                    locator<NavigationService>().navigateTo(AgreeTermsView);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Center(
                        child: Text(
                          "You have not Paid Rent\n        Tap here to pay",
                          style: GoogleFonts.dmSerifText(
                            fontSize: 18,
                            color: Color(0xff2079A5),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      // elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Text(
                              "Apartment Name:  ${model.agree.apartment.name}",
                              style: GoogleFonts.dmSerifText(
                                fontSize: 14,
                                color: Color(0xff2079A5),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Text(
                              "Apartment Type:  ${model.agree.apartment.type}",
                              style: GoogleFonts.dmSerifText(
                                fontSize: 14,
                                color: Color(0xff2079A5),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Text(
                              "Yearly Rent:  ${int.parse(model.agree.amount) * int.parse(model.agree.duration)} ${model.agree.currency}",
                              style: GoogleFonts.dmSerifText(
                                fontSize: 14,
                                color: Color(0xff2079A5),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClickText(
                                    text: Text(
                                      'Pack Out',
                                      style: GoogleFonts.dmSerifText(
                                        fontSize: 18,
                                        color: Color(0xff2079A5),
                                      ),
                                    ),
                                    onTap: () {
                                      model.leave(
                                          id: model.agree.apartmentId
                                              .toString());
                                    },
                                  ),
                                  ClickText(
                                    text: Text(
                                      'Pay',
                                      style: GoogleFonts.dmSerifText(
                                        fontSize: 18,
                                        color: Color(0xff2079A5),
                                      ),
                                    ),
                                    onTap: () {
                                      locator<NavigationService>()
                                          .navigateTo(AgreeTermsView);
                                    },
                                  ),
                                ],
                              ),
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

class Maintainance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenenantMaintainanceViewModel>.withConsumer(
      viewModelBuilder: () => TenenantMaintainanceViewModel(),
      onModelReady: (model) => model.allRequests(),
      builder: (context, model, _) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 9,
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Fix Request',
                        style: GoogleFonts.dmSerifText(
                          fontSize: 18,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      Text(
                        '${model.req.length}',
                        style: GoogleFonts.dmSerifText(
                          fontSize: 18,
                          color: Color(0xff2079A5),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Fixed',
                        style: GoogleFonts.dmSerifText(
                          fontSize: 18,
                          color: Color(0xff2079A5),
                        ),
                      ),
                      Fixed()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Fixed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenenantMaintainanceViewModel>.withConsumer(
      onModelReady: (model) => model.allFixedRequest(),
      viewModelBuilder: () => TenenantMaintainanceViewModel(),
      builder: (context, model, _) => Text(
        '${model.fixes.length}',
        style: GoogleFonts.dmSerifText(
          fontSize: 18,
          color: Color(0xff2079A5),
        ),
      ),
    );
  }
}

class PaymentStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TenantStatsViewModel>.withConsumer(
      viewModelBuilder: () => TenantStatsViewModel(),
      onModelReady: (model) => model.getPaymentStat(),
      builder: (context, model, _) {
        return Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          // color: Colors.redAccent,
          child: model.stat.lastPayment == null
              ? Card(
                  child: Center(
                    child: Text(
                      "You have not Paid Rent",
                      style: GoogleFonts.dmSerifText(
                        fontSize: 18,
                        color: Color(0xff2079A5),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        left: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last Rent Amount Paid: ${model.stat.lastPayment.amount}",
                            style: GoogleFonts.dmSerifText(
                              fontSize: 18,
                              color: Color(0xff2079A5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You paid for : ${model.stat.lastPayment.duration} Month(s)",
                            style: GoogleFonts.dmSerifText(
                              fontSize: 18,
                              color: Color(0xff2079A5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Months Left to Stay: ${model.stat.timeTillNextPayment}",
                            style: GoogleFonts.dmSerifText(
                              fontSize: 18,
                              color: Color(0xff2079A5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

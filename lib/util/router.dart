import 'package:flutter/material.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/payment_model.dart';
import 'package:pexza/models/tenant/maintainance_req.dart';
// import 'package:pexza/models/tenant/tenant_login_model.dart';
import 'package:pexza/views/landlord/add_tenant.dart';
import 'package:pexza/views/landlord/landing_page.dart';
import 'package:pexza/views/landlord/landlord_login.dart';
import 'package:pexza/views/landlord/landlord_signup.dart';
import 'package:pexza/views/landlord/tab_views/addviews/add_apartment.dart';
import 'package:pexza/views/landlord/tab_views/addviews/add_house.dart';
import 'package:pexza/views/landlord/tab_views/addviews/update_apartment.dart';
import 'package:pexza/views/landlord/tab_views/addviews/update_house.dart';
import 'package:pexza/views/landlord/tab_views/all_tenants.dart';
import 'package:pexza/views/landlord/tab_views/home.dart';
import 'package:pexza/views/landlord/update_password.dart';
import 'package:pexza/views/landlord/update_profile.dart';
import 'package:pexza/views/password_reset.dart';
import 'package:pexza/views/person_select.dart';
import 'package:pexza/views/tenant/mark_fixed_request.dart';
import 'package:pexza/views/tenant/otp_screen.dart';
import 'package:pexza/views/tenant/payment_view.dart';
import 'package:pexza/views/tenant/tab_views_tenant/payment_history.dart';
import 'package:pexza/views/tenant/update_password.dart';
import 'package:pexza/views/tenant/update_profile.dart';
import 'package:pexza/views/tenant/tenant_landing.dart';
import 'package:pexza/views/tenant/tenant_login.dart';
import 'package:pexza/views/tenant/tenant_signup.dart';
import 'package:pexza/views/tenant/terms.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ChooseView:
      return _getPageRoute(routeName: settings.name, view: Whoami());
    case LandLordSignInView:
      return _getPageRoute(routeName: settings.name, view: LandLordLogin());
    case LandLordSignUpView:
      return _getPageRoute(routeName: settings.name, view: LandLordSignUp());
    case TenantSignInView:
      return _getPageRoute(routeName: settings.name, view: TenantLogin());
    case TenantSignUpView:
      return _getPageRoute(routeName: settings.name, view: TenantSignup());
    case ConfirmLandLordView:
      return _getPageRoute(routeName: settings.name, view: ConfirmLandLord());
    case LandLordDashView:
      return _getPageRoute(routeName: settings.name, view: LandLordLanding());
    case PasswordResetViewLand:
      return _getPageRoute(routeName: settings.name, view: PasswordResetLand());
    case EmailFieldForPasswordResetViewTenant:
      return _getPageRoute(
          routeName: settings.name, view: EmailFieldForPasswordResetTenant());
    case PasswordResetViewTenant:
      return _getPageRoute(
          routeName: settings.name, view: PasswordResetTenannt());
    case EmailFieldForPasswordResetViewLand:
      return _getPageRoute(
          routeName: settings.name, view: EmailFieldForPasswordResetLand());
    case AddHouseView:
      return _getPageRoute(routeName: settings.name, view: AddHouse());
    case AddApartmentView:
      return _getPageRoute(routeName: settings.name, view: AddApartment());
    case LandLordHomeView:
      return _getPageRoute(routeName: settings.name, view: LandLordHome());
    case AddTenantView:
      return _getPageRoute(routeName: settings.name, view: AddTenant());
    case AgreeTermsView:
      return _getPageRoute(routeName: settings.name, view: AgreeTerms());
    case PaymentsView:
      var auth = settings.arguments as String;
      return _getPageRoute(
        routeName: settings.name,
        view: Payments(
          payment: auth,
        ),
      );
    case TenantLandingView:
      return _getPageRoute(routeName: settings.name, view: TenantLanding());
    case MarkFixedView:
      // var fix = settings.arguments as List<Req>;
      return _getPageRoute(
        routeName: settings.name,
        view: MarkFixed(
            // req: fix,
            ),
      );
    case ResetPasswordViewLand:
      return _getPageRoute(routeName: settings.name, view: ResetPasswordLand());
    case ResetPasswordViewTenant:
      return _getPageRoute(
          routeName: settings.name, view: ResetPasswordTenant());
    case UpdateTenantProfileView:
      // var user = settings.arguments as TenantIndividual;
      return _getPageRoute(
        routeName: settings.name,
        view: UpdateTenantProfile(),
      );
    case UpdateLandLordProfileView:
      return _getPageRoute(
        routeName: settings.name,
        view: UpdateLandLordProfile(),
      );
    case UpdateTenantPasswordView:
      return _getPageRoute(
        routeName: settings.name,
        view: UpdateTenantPassword(),
      );
    case UpdateLandLordPasswordView:
      return _getPageRoute(
        routeName: settings.name,
        view: UpdateLandLordPassword(),
      );
    case UpdateHouseView:
      var id = settings.arguments as int;
      return _getPageRoute(
        routeName: settings.name,
        view: UpdateHouse(id: id),
      );
    case PaymentHistoryView:
      return _getPageRoute(
        routeName: settings.name,
        view: PaymentHistory(),
      );
    case AllTenantsView:
      return _getPageRoute(
        routeName: settings.name,
        view: AllTenants(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text("No route defined for ${settings.name}"),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget view}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => view);
}

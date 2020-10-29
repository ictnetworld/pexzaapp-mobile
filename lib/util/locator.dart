import 'package:get_it/get_it.dart';
import 'package:pexza/api/change_password.dart';
import 'package:pexza/api/landlord/create_house.dart';
import 'package:pexza/api/landlord/create_tenant.dart';
import 'package:pexza/api/landlord/landlord_login.dart';
import 'package:pexza/api/landlord/landlord_signup.dart';
import 'package:pexza/api/landlord/update_profile.dart';
import 'package:pexza/api/log_out.dart';
import 'package:pexza/api/tenant/confirm_agreement.dart';
import 'package:pexza/api/tenant/request_fix.dart';
import 'package:pexza/api/tenant/tenant_login.dart';
import 'package:pexza/api/tenant/tenant_signup.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/image_picker.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => LandLordSignUpAPI());
  locator.registerLazySingleton(() => LandLordSignInAPI());
  locator.registerLazySingleton(() => TenantSignInAPI());
  locator.registerLazySingleton(() => TenantSignUpAPI());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => PrefsManager());
  locator.registerLazySingleton(() => PasswordResetApi());
  locator.registerLazySingleton(() => LandLordHousesApi());
  locator.registerLazySingleton(() => CreateTenantAPI());
  locator.registerLazySingleton(() => ConfirmAgreementAPI());
  locator.registerLazySingleton(() => MaintainanceAPI());
  locator.registerLazySingleton(() => UpdateProfileAPI());
  locator.registerLazySingleton(() => PickImage());
  locator.registerLazySingleton(() => LogoutAPI());
}
import 'package:pexza/api/landlord/landlord_signup.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/view_model/base_model.dart';

class LandLordSignUpViewModel extends BaseModel {
  var sigup = locator<LandLordSignUpAPI>();
  var nav = locator<NavigationService>();
  var dialognav = locator<DialogService>();
  Future signup(
      {String firstname,
      String lastname,
      String phoneNumber,
      String email,
      String password,
      String age,
      String gender}) async {
    setBusy(true);
    var res = await sigup.signup(
        firstname: firstname,
        lastname: lastname,
        phoneNumber: "0" + phoneNumber,
        email: email,
        password: password,
        age: age,
        gender: gender);
    setBusy(false);
    if (res.statusCode == 201) {
      dialognav.showDialog(
        title: "Success",
        description: "Registeration Successful!",
        buttonTitle: "Okay",
      );
      nav.navigateTo(LandLordSignInView);
    }
    if (res.statusCode == 422) {
      dialognav.showDialog(
        title: "Error",
        description: "This user already exists login",
        buttonTitle: "Okay",
      );
      nav.navigateTo(LandLordSignInView);
    }
    if (res.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
    }
    if (res.statusCode == 200) {
      dialognav.showDialog(
        title: "Error!",
        description: "Registeration details are not accepted",
        buttonTitle: "Okay",
      );
    }
  }
}

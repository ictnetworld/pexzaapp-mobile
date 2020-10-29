import 'dart:io';

import 'package:pexza/api/landlord/update_profile.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/image_picker.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class UpdateProfileViewModel extends BaseModel {
  var updatePerson = locator<UpdateProfileAPI>();
  var prefs = locator<PrefsManager>();
  var dialognav = locator<DialogService>();
  var imgs = locator<PickImage>();
  var nav = locator<NavigationService>();

  // File _takenImage;
  // File get takenImage => _takenImage;

  File _zeImage;
  File get pickedImage => _zeImage;

  Future pickImage() async {
    var picked = await imgs.selectImage();
    _zeImage = picked;
    notifyListeners();
  }

  Future takeImage() async {
    var taken = await imgs.takeImage();
    _zeImage = taken;
    notifyListeners();
  }

  // Update Tenant Profile
  Future updateProfileTenant(
      {String firstname,
      String lastname,
      String phoneNumber,
      String email,
      String profileImage}) async {
    setBusy(true);
    var token = await prefs.getTenantToken();
    var update = await updatePerson.updateProfile(
      firstname: firstname,
      lastname: lastname,
      phoneNumber: phoneNumber,
      email: email,
      token: token,
      profileImage: profileImage,
    );
    setBusy(false);
    if (update.statusCode == 200) {
      dialognav.showDialog(
          title: "Success",
          description: "You have successfully updated your profile",
          buttonTitle: "Okay");
      setBusy(false);
      // nav.pop();
    }
    if (update.statusCode == 422) {
      dialognav.showDialog(
        title: "User Exists",
        description: "Someone else exist with this email or phone number",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    if (update.statusCode == 408) {
      dialognav.showDialog(
        title: "Request Error",
        description: "Request Timed Out!",
        buttonTitle: "Okay",
      );
      setBusy(false);
    }
    if (update.statusCode == 500) {
      dialognav.showDialog(
          title: "Server Error!",
          description: "Server is currently under maintainance try again later",
          buttonTitle: "Okay");
      setBusy(false);
    }
  }

  // Update Landlord Profile
  Future updateProfileLand({
    String firstname,
    String lastname,
    String phoneNumber,
    String email,
    String profileImage,
  }) async {
    setBusy(true);
    var token = await prefs.getLandLordToken();
    var update = await updatePerson.updateProfile(
      firstname: firstname,
      lastname: lastname,
      phoneNumber: phoneNumber,
      email: email,
      token: token,
      profileImage: profileImage,
    );
    if (update.statusCode == 200) {
      dialognav.showDialog(
          title: "Success",
          description: "You have successfully updated your profile",
          buttonTitle: "Okay");
      setBusy(false);
    }
    if (update.statusCode == 422) {
      dialognav.showDialog(
        title: "User Exists",
        description: "Someone else exist with this email or phone number",
        buttonTitle: "Okay",
      );
    }
    if (update.statusCode == 408) {
      dialognav.showDialog(
        title: "Request Error",
        description: "Request Timed Out!",
        buttonTitle: "Okay",
      );
    }
    if (update.statusCode == 500) {
      dialognav.showDialog(
          title: "Server Error!",
          description: "Server is currently under maintainance try again later",
          buttonTitle: "Okay");
    }
  }
}

import 'dart:io';

import 'package:pexza/api/landlord/create_house.dart';
import 'package:pexza/api/landlord/landlord_login.dart';
import 'package:pexza/constants/routes.dart';
import 'package:pexza/models/landlord/apartments.dart';
import 'package:pexza/models/landlord/landlord_login_model.dart';
import 'package:pexza/models/landlord/own_houses.dart';
import 'package:pexza/util/dialog_service.dart';
import 'package:pexza/util/image_picker.dart';
import 'package:pexza/util/locator.dart';
import 'package:pexza/util/navigation.dart';
import 'package:pexza/util/prefs.dart';
import 'package:pexza/view_model/base_model.dart';

class HomeViewmodel extends BaseModel {
  var sigin = locator<LandLordSignInAPI>();
  var prefs = locator<PrefsManager>();
  List<Data> houses = List<Data>();
  var addHouse = locator<LandLordHousesApi>();
  Landlordperson user = Landlordperson();
  var nav = locator<NavigationService>();
  var dialognav = locator<DialogService>();
  List<Apartment> apartment = List<Apartment>();
  var imgs = locator<PickImage>();

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

  Future getUser() async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    var userRes = await sigin.getUser(token);
    this.user = userRes;
    setBusy(false);
    notifyListeners();
  }

  Future getHouses() async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    final house = await addHouse.getHouses(token: token);
    this.houses = house;
    // print(this.houses.length);
    setBusy(false);
    notifyListeners();
  }

  Future addAHouse(
      {String propertyName,
      String propertyType,
      String houseType,
      String streetName,
      String city,
      String state,
      String country,
      String token,
      String houseImg}) async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    final adding = await addHouse.addHouse(
        propertyName: propertyName,
        propertyType: propertyType,
        houseType: houseType,
        streetName: streetName,
        city: city,
        state: state,
        country: country,
        token: token,
        houseImg: houseImg);
    if (adding.statusCode == 201) {
      await getHouses();
      nav.navigateTo(LandLordDashView);
      setBusy(false);
    }
    if (adding.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
      setBusy(false);
    }
    notifyListeners();
  }

  Future addApartment(
      {String id,
      String name,
      String type,
      String description,
      String token}) async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    final addDApartment = await addHouse.addApartment(
        id: id, name: name, type: type, description: description, token: token);
    setBusy(false);
    if (addDApartment.statusCode == 201) {
      dialognav.showDialog(
        title: "Success!",
        description: "Apartment Created Successfully",
        buttonTitle: "Back",
      );
    } else if (addDApartment.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
    } else {
      dialognav.showDialog(
          title: "Error!",
          description: "An error occured try again",
          buttonTitle: "Try Again");
    }
    notifyListeners();
  }

  Future getApartments(String id) async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    final apartments = await addHouse.getApartments(token: token, id: id);
    this.apartment = apartments;
    setBusy(false);
    notifyListeners();
  }

  Future updateHouse(
      {String id,
      String propertyName,
      String propertyType,
      String houseType,
      String streetName,
      String city,
      String state,
      String country,
      String houseImg}) async {
        setBusy(true);
    final token = await prefs.getLandLordToken();
    var update = await addHouse.updateHouse(
      id: id,
        propertyName: propertyName,
        propertyType: propertyType,
        houseType: houseType,
        streetName: streetName,
        city: city,
        state: state,
        country: country,
        token: token,
        houseImg: houseImg);
        print(update.statusCode);
    if (update.statusCode == 200) {
      await getHouses();
      nav.navigateTo(LandLordDashView);
      setBusy(false);
    }
    if (update.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
      setBusy(false);
    }
    notifyListeners();
  }

  Future updateApartment(
      {String id,
      String name,
      String type,
      String description,
      String token}) async {
    setBusy(true);
    final token = await prefs.getLandLordToken();
    final addDApartment = await addHouse.updateApartment(
        id: id, name: name, type: type, description: description, token: token);
    setBusy(false);
    if (addDApartment.statusCode == 200) {
      dialognav.showDialog(
        title: "Success!",
        description: "Apartment Created Successfully",
        buttonTitle: "Back",
      );
      setBusy(false);
    } else if (addDApartment.statusCode == 408) {
      dialognav.showDialog(
          title: "Error!",
          description: "Request timed out! \nTry again laterq",
          buttonTitle: "Try Again");
      setBusy(false);
    } else {
      dialognav.showDialog(
          title: "Error!",
          description: "An error occured try again",
          buttonTitle: "Try Again");
      setBusy(false);
    }
    notifyListeners();
  }
}

import 'dart:convert';

// import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:pexza/models/landlord/apartments.dart';
import 'package:pexza/models/landlord/own_houses.dart';
import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';

class LandLordHousesApi {
  Future<Response> addHouse(
      {String propertyName,
      String propertyType,
      String houseType,
      String streetName,
      String city,
      String state,
      String country,
      String token,
      String houseImg}) async {
    var imgname = DateTime.now().millisecondsSinceEpoch.toString();
    FormData data = FormData.fromMap({
      "name": propertyName,
      "property_type": propertyType,
      "house_type": houseType,
      "street": streetName,
      "town": city,
      "state": state,
      "country": country,
      "photo": await MultipartFile.fromFile(
        houseImg,
        filename: imgname,
      )
    });
    String url = "https://pexzaapp.com/api/v1/houses/store";
    var add = await Dio().post(
      url,
      data: data,
      options: Options(
        headers: {
          'Accept': "application/json",
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'multipart/form-data',
        },
      ),
    );
    return add;
  }

  Future<List<Data>> getHouses({String token}) async {
    String url = "https://pexzaapp.com/api/v1/houses/";
    var houses = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (houses.statusCode == 200) {
      return OwnHouses.fromJson(jsonDecode(houses.body)).data;
    }
    return null;
  }

  Future<http.Response> addApartment(
      {String id,
      String name,
      String type,
      String description,
      String token}) async {
    String url = "https://pexzaapp.com/api/v1/apartments/$id/store";
    var addApartment = http.post(url, body: {
      "name": name,
      "type": type,
      "description": description
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return addApartment;
  }

  Future<List<Apartment>> getApartments({String token, String id}) async {
    String url = "https://pexzaapp.com/api/v1/apartments/$id";
    var apartments = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (apartments.statusCode == 200) {
      return Apartments.fromJson(jsonDecode(apartments.body)).data;
    }
    return null;
  }

  Future<Response> updateHouse(
      {String token,
      String id,
      String propertyName,
      String propertyType,
      String houseType,
      String streetName,
      String city,
      String state,
      String country,
      String houseImg}) async {
    print(id);
    String url = "https://pexzaapp.com/api/v1/houses/$id/update";
    var imgname = DateTime.now().millisecondsSinceEpoch.toString();
    if (houseImg == null) {
      FormData data = FormData.fromMap({
        "name": propertyName,
        "property_type": propertyType,
        "house_type": houseType,
        "street": streetName,
        "town": city,
        "state": state,
        "country": country,
        // "photo": await MultipartFile.fromFile(
        //   houseImg,
        //   filename: imgname,
        // )
      });
      var updateHouse = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return updateHouse;
    } else {
      FormData data = FormData.fromMap({
        "name": propertyName,
        "property_type": propertyType,
        "house_type": houseType,
        "street": streetName,
        "town": city,
        "state": state,
        "country": country,
        "photo": await MultipartFile.fromFile(
          houseImg,
          filename: imgname,
        )
      });
      var updateHouse = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return updateHouse;
    }
  }

  Future<http.Response> updateApartment({
    String token,
    String id,
    String name,
    String type,
    String description,
  }) async {
    String url = "https://pexzaapp.com/api/v1/apartments/$id/update";
    var updateApartment = await http.post(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: {
      "name": name,
      "type": type,
      "description": description
    });
    return updateApartment;
  }
}

import 'package:dio/dio.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';

class UpdateProfileAPI {
  var imgname = DateTime.now().millisecondsSinceEpoch.toString();
  Future<Response> updateProfile({
    String firstname,
    String lastname,
    String phoneNumber,
    String email,
    String token,
    String profileImage,
  }) async {
    String url = "https://pexzaapp.com/api/v1/user/profile/update";
    if (profileImage == null) {
      FormData data = FormData.fromMap({
        "phone": phoneNumber,
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
      });
      var req = await Dio().post(
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
      print("${req.statusCode}");
      print("${req.data}");
      print("${req.request.data.toString()}");
      return req;
    } else {
      FormData datawithout = FormData.fromMap({
        "phone": phoneNumber,
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "photo": await MultipartFile.fromFile(profileImage, filename: imgname),
      });
      var req = await Dio().post(
        url,
        data: datawithout,
        options: Options(
          headers: {
            'Accept': "application/json",
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'multipart/form-data',
          },
        ),
      );
      print("With picture ${req.statusCode}");
      print("With picture ${req.data}");
      // print("With picture ${req.request.queryParameters.values}");
      return req;
    }
  }
}

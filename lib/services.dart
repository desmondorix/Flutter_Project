import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class Services {
  static const url = "http://10.0.2.2/study_flutter/";

  static Future<Map?> register(
      {required String username, required String kelas}) async {
    if (username.isNotEmpty && kelas.isNotEmpty) {
      String uri = "http://10.0.2.2/study_flutter/register.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "username": username,
          "kelas": kelas,
        });
        if (res.statusCode == 200) {
          var responseBody = res.body;
          if (responseBody.isNotEmpty) {
            var response = jsonDecode(responseBody);

            if (response is Map) {
              return response; // Return the response map
            } else {
              print("Invalid server response format: $responseBody");
              return null;
            }
          } else {
            print("Empty response body");
            return null;
          }
        } else {
          print("HTTP Error: ${res.statusCode}");
          return null;
        }
      } catch (e) {
        print("Error: $e");
        return null;
      }
    } else {
      print("Please fill all fields");
      return null;
    }
  }
}

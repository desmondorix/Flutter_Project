import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:async';
// import 'package:dio/dio.dart';

abstract class Services {
  static const url = "http://10.0.2.2/study_flutter/";

  static Future<Map?> register(
      {required String username, required String kelas}) async {
    if (username != "" || kelas != "") {
      String uri = "http://10.0.2.2/study_flutter/register.php";
      try {
        var res = await http.post(Uri.parse(uri), body: {
          "username": username,
          "kelas": kelas,
        });
        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Inserted");
          username = "";
          kelas = "";
        } else {
          print("some issue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("please fill all fields");
    }
  }

  // static Future<Map?> register(
  //     {required String username, required String kelas}) async {
  //     try {
  //     Response? response = await Dio().post("$url/register.php",
  //         data: {
  //           "username" : username,
  //           "kelas" : kelas,
  //         });
  //     if (response.statusCode == 201) {
  //       return response.data as Map;
  //     } else {
  //       throw Exception(response.data['message']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<Map?> register(
  //     {required String nim,
  //     required String name,
  //     required String password}) async {
  //   try {
  //     Response? response = await Dio().post("$apiUrl/register",
  //         options: Options(headers: {"Accept": "application/json"}),
  //         data: {
  //           "nim": nim,
  //           "name": name,
  //           "password": password,
  //         });
  //     if (response.statusCode == 201) {
  //       return response.data as Map;
  //     } else {
  //       throw Exception(response.data['message']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // static Future<Map?> login(
  //     {required String nim, required String password}) async {
  //   try {
  //     Response? response = await Dio().post("$apiUrl/login",
  //         options: Options(headers: {"Accept": "application/json"}),
  //         data: {
  //           "nim": nim,
  //           "password": password,
  //         });
  //     if (response.statusCode == 200) {
  //       return response.data as Map;
  //     } else {
  //       throw Exception(response.data['message']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  //

//   static Future<Response?> logout(String token) async {
//     try {
//       Response? response = await Dio().get(
//         "$apiUrl/logout",
//         options: Options(
//           headers: {
//             "Accept" : "application/json",
//             "Authorization" : "Bearer $token",
//           }
//         )
//       );
//       if (response.statusCode == 200) {
//         return response;
//       }else{
//         throw Exception(response.data['message']);
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
}

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

static Future<Map?> login({required String username}) async {
  if (username.isNotEmpty) {
    String uri = "http://10.0.2.2/study_flutter/login.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {
        "username": username,
      });
      if (res.statusCode == 200) {
        var responseBody = res.body;
        if (responseBody.isNotEmpty) {
          var response = jsonDecode(responseBody);

          if (response is Map) {
            if (response["success"] == true) {
              // Login successful, return the response
              return response;
            } else {
              // Login unsuccessful, print error message
              print("Login failed: ${response['message']}");
              return null;
            }
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
    print("Please provide a username");
    return null;
  }
}

static Future<Map?> submitScore({
    required String username,
    required String nilai,
  }) async {
    String uri = "http://10.0.2.2/study_flutter/insertnilai.php";

    try {
      Map<String, String> body = {
        "username": username,
        "nilai": nilai,
      };

      var res = await http.post(Uri.parse(uri), body: body);

      if (res.statusCode == 200) {
        try {
          // Attempt to parse the response as JSON
          var parsedResponse = jsonDecode(res.body);

          if (parsedResponse is Map) {
            return parsedResponse;
          } else {
            print("Invalid server response format: $parsedResponse");
            return null;
          }
        } catch (e) {
          print("Error parsing server response: $e");
          return null;
        }
      } else {
        print("HTTP Error: ${res.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error submitting score: $e");
      return null;
    }
  }

  static const String baseUrl = "http://10.0.2.2/study_flutter/";

  static Future<Map?> selectNilai({required String username}) async {
    String uri = "${baseUrl}selectnilai.php";

    try {
      var res = await http.post(Uri.parse(uri), body: {
        "username": username,
      });

      if (res.statusCode == 200) {
        try {
          // Attempt to parse the response as JSON
          var parsedResponse = jsonDecode(res.body);

          if (parsedResponse is Map) {
            return parsedResponse;
          } else {
            print("Invalid server response format: $parsedResponse");
            return null;
          }
        } catch (e) {
          print("Error parsing server response: $e");
          return null;
        }
      } else {
        print("HTTP Error: ${res.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error retrieving score: $e");
      return null;
    }
  }

  static Future<Map?> selectKelas({required String username}) async {
    String uri = baseUrl + "selectkelas.php";

    try {
      var res = await http.post(Uri.parse(uri), body: {
        "username": username,
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
  }
}
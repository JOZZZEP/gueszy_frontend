import 'dart:convert';

import 'package:gueszy/constant/endpoint.dart';
import 'package:gueszy/models/index.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static String url = "${Endpoint.endpoint}/gueszy/user/login";

  static Future<User> postUser(Map<String, String> user) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user),
      );
      if (200 == response.statusCode) {
        return parseUser(response.body);
      } else {
        return User();
      }
    } catch (e) {
      return User();
    }
  }

  static User parseUser(String responseBody) {
    final parsed = json.decode(responseBody);
    return User.fromJson(parsed);
  }

  static Future<int> registerUser(Map<String, String> user) async {
    String url = "${Endpoint.endpoint}/gueszy/user/register";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user),
      );
      return response.statusCode;
    } catch (e) {
      return -1;
    }
  }
}

void main(List<String> args) {
  UserServices.registerUser({"name": "testUser3", "password": "1234"})
      .then((value) => print(value));
}

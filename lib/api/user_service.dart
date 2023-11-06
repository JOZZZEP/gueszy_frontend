import 'dart:convert';

import 'package:gueszy/models/index.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static const String url = "http://192.168.1.131:8080/gueszy/user/login";

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
}

void main(List<String> args) {
  UserServices.postUser({"name": "testUser", "password": "1234"})
      .then((value) => print(value.id.toString() + value.name));
}

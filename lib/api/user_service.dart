import 'dart:convert';

import 'package:gueszy/models/index.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static const String url = "http://192.168.1.131:8080/gueszy/user";

  static Future<Users> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return Users();
      }
    } catch (e) {
      return Users();
    }
  }

  static Users parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<User> gameList =
        parsed.map<User>((json) => User.fromJson(json)).toList();
    Users users = Users();
    users.users = gameList;
    return users;
  }
}

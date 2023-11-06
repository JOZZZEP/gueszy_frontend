import 'dart:convert';

import 'package:gueszy/models/index.dart';
import 'package:http/http.dart' as http;

class GameServices {
  static const String url = "http://192.168.1.131:8080/gueszy/game";

  static Future<Games> getGames() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final responseBody = utf8.decode(response.bodyBytes);
        return parseGames(responseBody);
      } else {
        return Games();
      }
    } catch (e) {
      return Games();
    }
  }

  static Games parseGames(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Game> gameList =
        parsed.map<Game>((json) => Game.fromJson(json)).toList();
    Games games = Games();
    games.games = gameList;
    return games;
  }
}

void main(List<String> args) async {
  String url = "http://192.168.56.1:8080/gueszy/game";
  final response = await http.get(Uri.parse(url));
  final responseBody = utf8.decode(response.bodyBytes);
  print(responseBody);
}

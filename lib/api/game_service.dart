import 'dart:convert';

import 'package:gueszy/constant/endpoint.dart';
import 'package:gueszy/models/index.dart';
import 'package:http/http.dart' as http;

class GameServices {
  static String url = "${Endpoint.endpoint}/gueszy/game";

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

  static Future<Games> getGamesById(int id) async {
    String url = "${Endpoint.endpoint}/gueszy/game/userId/$id";
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

  static Future<void> insertGame(Map<String, dynamic> data) async {
    String url = "${Endpoint.endpoint}/gueszy/game/insert";
    print(data);
    await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  static Future<void> deleteGame(int id) async {
    String url = "${Endpoint.endpoint}/gueszy/game/delete/$id";
    await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}

void main(List<String> args) async {
  GameServices.deleteGame(13);

  // GameServices.getGamesById(2).then((value) {
  //   print(value.games.length);
  //   for (int i = 0; i < value.games.length; i++) {
  //     print(value.games[i].name);
  //     // print(value.games[1].name);
  //   }
  // });

  // String url = "http://192.168.56.1:8080/gueszy/game";
  // final response = await http.get(Uri.parse(url));
  // final responseBody = utf8.decode(response.bodyBytes);
  // print(responseBody);

  // Map<String, dynamic> data = {
  //   "name": "test2",
  //   "image": "no",
  //   "userId": "2",
  //   "access": "0",
  //   "word": ["q1", "q2"]
  // };
  // GameServices.insertGame(data);
}

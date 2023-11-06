import 'dart:convert';

import 'package:gueszy/constant/endpoint.dart';
import 'package:gueszy/models/index.dart';
import 'package:http/http.dart' as http;

class VocabServices {
  static Future<Vocabularys> getVocab(int id) async {
    try {
      String url =
          ("${Endpoint.endpoint}/gueszy/vocabulary/gameId/") + id.toString();
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final responseBody = utf8.decode(response.bodyBytes);
        return parseVocab(responseBody);
      } else {
        return Vocabularys();
      }
    } catch (e) {
      return Vocabularys();
    }
  }

  static Vocabularys parseVocab(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Vocabulary> vocab =
        parsed.map<Vocabulary>((json) => Vocabulary.fromJson(json)).toList();
    Vocabularys vocabs = Vocabularys();
    vocabs.vocabularys = vocab;
    return vocabs;
  }
}

void main(List<String> args) async {
  String url = "${Endpoint.endpoint}/gueszy/game";
  final response = await http.get(Uri.parse(url));
  final responseBody = utf8.decode(response.bodyBytes);
  print(responseBody);
}

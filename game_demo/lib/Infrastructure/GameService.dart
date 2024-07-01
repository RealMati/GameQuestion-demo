import 'dart:convert';

import 'package:game_demo/Domain/entities/Grade.dart';
import 'package:game_demo/Domain/entities/Question.dart';
import 'package:game_demo/Domain/entities/SubjectAndLevel.dart';
import 'package:http/http.dart' as http;
import 'package:game_demo/Infrastructure/core/url.dart';

class GameService {
  final baseUrl = Domain.url;

  Future<List<Grade>> getGrades() async {
    final response = await http.get(Uri.parse('$baseUrl/grades'));
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> games = json.decode(response.body);
      // print(games);
      final r = List<Grade>.from(games.map((model) => Grade.fromJson(model)));
      // print(r);
      return r;
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<List<SubjectAndLevel>> getSubjectAndLevel() async {
    final response = await http.get(Uri.parse('$baseUrl/subject-level/9/9/'));
    // print(response.body);
    if (response.statusCode == 200) {
      final List<dynamic> games = json.decode(response.body);
      // print(games);
      final r = List<SubjectAndLevel>.from(
          games.map((model) => SubjectAndLevel.fromJson(model)));
      // print(r);
      return r;
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<List<Question>> getQuestion() async {
    final response =
        await http.get(Uri.parse('$baseUrl/gamequestion-detail/1/13/18/'));
    // print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        // print("before games");
        final Map<String, dynamic> decodedResponse = json.decode(response.body);

        // print(decodedResponse);
        final List<dynamic> games = decodedResponse['data'];
        // print("games");
        // print(games);
        final r =
            List<Question>.from(games.map((model) => Question.fromJson(model)));

        return r;
      } else {
        throw Exception('Failed to load games');
      }
    } catch (e) {
      throw Exception('An error occurred while fetching the question: $e');
    }
  }
}

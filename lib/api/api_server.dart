import 'dart:convert';
import 'package:http/http.dart' as http;

class ProgressEntry {
  final String date;
  final int weight;

  ProgressEntry({required this.date, required this.weight});

  Map<String, dynamic> toJson() => {'date': date, 'weight': weight};
}

class ApiService {
  static const String baseUrl =
      'https://outline-rendering-cookie-robertson.trycloudflare.com/api';

  static Future<Map<String, dynamic>> getExercises() async {
    final response = await http.get(Uri.parse('$baseUrl/Exercises'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Ошибка ${response.statusCode} при загрузке упражнений');
    }
  }

  static Future<void> addProgress(int exerciseId, int weight) async {
    final url = Uri.parse('$baseUrl/exercises/$exerciseId/progress');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'weight': weight}),
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка ${response.statusCode} при добавлении прогресса');
    }
  }

  static Future<Map<String, dynamic>> getUserBodyWeight() async {
    final response = await http.get(Uri.parse('$baseUrl/UserWeight'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Ошибка ${response.statusCode} при получении веса пользователя',
      );
    }
  }

  static Future<void> addUserBodyWeight(int weight) async {
    final url = Uri.parse('$baseUrl/UserWeight/1/progress');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'weight': weight}),
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка при добавлении веса пользователя');
    }
  }
}

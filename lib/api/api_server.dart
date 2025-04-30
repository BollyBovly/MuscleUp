import 'dart:convert';
import 'package:http/http.dart' as http;

class ProgressEntry {
  final String date;
  final int weight;

  ProgressEntry({required this.date, required this.weight});

  Map<String, dynamic> toJson() => {'date': date, 'weight': weight};
}

class ApiService {
  static const String baseUrl = 'https://78d3-62-76-239-184.ngrok-free.app/api';

  static Future<List<dynamic>> getExercises() async {
    final response = await http.get(Uri.parse('$baseUrl/exercises'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Ошибка при загрузке упражнений');
    }
  }

  static Future<void> addProgress(int exerciseId, int weight) async {
    final response = await http.post(
      Uri.parse('$baseUrl/exercises/$exerciseId/progress'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'weight': weight}),
    );

    if (response.statusCode != 200) {
      throw Exception('Ошибка при добавлении прогресса');
    }
  }
}

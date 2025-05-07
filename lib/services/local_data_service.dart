import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:musleapp/models/exercise_parsing.dart';
import 'package:path_provider/path_provider.dart';


class LocalDataService {
  static const _fileName = 'exercises.json';

  Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  Future<void> _copyFromAssetsIfNeeded() async {
    final file = await _getLocalFile();
    if (!(await file.exists())) {
      final jsonString = await rootBundle.loadString(
        'lib/assets/data/exercise.json',
      );
      await file.writeAsString(jsonString);
    }
  }

  Future<List<Exercise>> loadExercises() async {
    await _copyFromAssetsIfNeeded();
    final file = await _getLocalFile();
    final content = await file.readAsString();
    final jsonData = jsonDecode(content) as List;
    return jsonData.map((e) => Exercise.fromJson(e)).toList();
  }

  Future<void> saveExercises(List<Exercise> exercises) async {
    final file = await _getLocalFile();
    final jsonString = jsonEncode(exercises.map((e) => e.toJson()).toList());
    await file.writeAsString(jsonString);
  }

  Future<void> addProgressToExercise(int index, double newWeight) async {
    final exercises = await loadExercises();
    final today = DateTime.now();
    final dateStr =
        "${today.day.toString().padLeft(2, '0')}-"
        "${today.month.toString().padLeft(2, '0')}-"
        "${today.year}";

    exercises[index].progress.add(
      ProgressEntry(date: dateStr, weight: newWeight),
    );

    await saveExercises(exercises);
  }
}

import 'package:flutter/material.dart';
import 'package:musleapp/api/api_server.dart';


class ExerciseWidget extends StatefulWidget {
  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  Future<List<dynamic>>? exercises;

  @override
  void initState() {
    super.initState();
    exercises = ApiService.getExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Упражнения'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: exercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Нет доступных упражнений'));
          } else {
            final firstExercise = snapshot.data![0];
            final exerciseName = firstExercise['progress'] ?? 'Имя не найдено';

            return Center(
              child: Text(
                'Первое упражнение: $exerciseName',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}


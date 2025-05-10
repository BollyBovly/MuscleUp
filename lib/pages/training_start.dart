import 'package:flutter/material.dart';
import 'package:musleapp/api/api_server.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/pages/training_screen.dart';

class TrainingStart extends StatefulWidget{
  const TrainingStart({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return TrainingStartState();
  }
}

class TrainingStartState extends State<TrainingStart>{

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
        title: const Text(
          'Упражнение',
          style: TextStyle(
            fontWeight: FontWeight.w300
          ),
        ),
        backgroundColor: backgroundColor,
        leading: Align(alignment: Alignment.centerRight, child: Builder(
          builder: (context){
            return IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                alignment: Alignment.center,
            );
          }
        ),
        ),
      ),
      body: FutureBuilder(
        future: exercises, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No exercises available'));
          } else {
            final exercise = snapshot.data![0];
            return TrainingScreen(
              reps: exercise['reps'],
              sets: exercise['sets'],
              name: exercise['name'],
            );
          }
        }
      )
    );
  }
}
  

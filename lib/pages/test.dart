import 'package:flutter/material.dart';
import 'package:musleapp/services/local_data_service.dart';


class AddProgressScreen extends StatefulWidget {
  @override
  _AddProgressScreenState createState() => _AddProgressScreenState();
}

class _AddProgressScreenState extends State<AddProgressScreen> {
  final TextEditingController _weightController = TextEditingController();
  final LocalDataService _dataService = LocalDataService();

  void _addProgress() async {
    final double newWeight = double.tryParse(_weightController.text) ?? 0;
    if (newWeight > 0) {
      await _dataService.addProgressToExercise(0, newWeight); // Добавление в первый элемент для примера
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Progress added')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid weight')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Progress')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Enter weight'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addProgress,
              child: Text('Add Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
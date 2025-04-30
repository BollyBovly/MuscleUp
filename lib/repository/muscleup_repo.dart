import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MuscleUpRepository {
  Future<void> getExercises() async {
    final response = await Dio().get(
      'https://78d3-62-76-239-184.ngrok-free.app/api/Exercises',
    );
    debugPrint(response.toString());
  }
}

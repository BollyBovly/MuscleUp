import 'package:flutter/material.dart';

class TrainingDescription extends StatelessWidget{
  const TrainingDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 160,
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Flexible(
              child: Text(
                'Привет! Сегодня поработаем над всеми мышцами твоего тела, чтобы уже скоро ты мог похвастаться хорошим результатом! Разминаемся и приступаем к действию!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16
                )
              ),
            )
          ],
        )
      )
    );
  }
}
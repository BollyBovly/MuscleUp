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
                'Это я - твой единственный зритель. Я на протяжении многих лет создавал  иллюзию того, что тебя смотрят много людей, но это был я. Сейчас напишу  это сообщение со всех аккаунтов.',
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
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/services/training_controller.dart';

class ApproachTimer extends StatefulWidget {
  const ApproachTimer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ApproachTimerState();
  }
}

class _ApproachTimerState extends State<ApproachTimer> {
  int _start = 180; // 3 минуты в секундах
  Timer? _timer;
  bool _isRunning = false; // Флаг для отслеживания состояния таймера

  void _startTimer() {
    if (_isRunning) return; // Если таймер уже запущен, ничего не делаем

    _isRunning = true; // Устанавливаем флаг в true
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
        _isRunning = false; // Сбрасываем флаг, когда таймер закончился
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _start = 180; // Сбрасываем на 3 минуты
      _isRunning = false; // Сбрасываем флаг
    });
    _timer?.cancel(); // Останавливаем таймер, если он работает
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = (_start / 60).floor();
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пора отдохнуть!'),
        backgroundColor: backgroundColor,
        leading: Align(
          alignment: Alignment.centerRight,
          child: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                alignment: Alignment.center,
              );
            },
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: backgroundColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  color: textButtonColor,
                  borderRadius: BorderRadius.circular(130),
                  boxShadow: [
                    BoxShadow(
                      color: timerColor,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    timerText,
                    style: TextStyle(
                      fontSize: 90,
                      color: circleColor,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: elevationColor,
                    spreadRadius: 0.25,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_isRunning) {
                    _resetTimer(); // Если таймер закончился, сбрасываем его
                  } else {
                    _startTimer(); // Запускаем таймер по нажатию кнопки
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),
                  minimumSize: Size(MediaQuery.of(context).size.width - 150, MediaQuery.of(context).size.width - 300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                ),
                child: Text(
                  _isRunning ? 'Сбросить таймер' : 'Начать отдых',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: textButtonColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: elevationColor,
                    spreadRadius: 0.25,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (TrainingController.ex_index < 5){
                    TrainingController.ex_index++;
                    Navigator.of(context).pushNamed('/start');
                  }
                  else{
                    Navigator.of(context).pushNamed('/over');
                  }
                  
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),
                  minimumSize: Size(MediaQuery.of(context).size.width - 150, MediaQuery.of(context).size.width - 300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                ),
                child: Text(
                  'Далее',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: textButtonColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

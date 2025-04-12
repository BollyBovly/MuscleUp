import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class ApproachTimer extends StatelessWidget {
  const ApproachTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Название упражнения'),
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
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '3:37',
                    style: TextStyle(fontSize: 90, color: circleColor),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
              ),
              child: ElevatedButton(
                onPressed: () => {print('timer started')},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),
                  elevation: 0.0,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width - 150,
                    MediaQuery.of(context).size.width - 300,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                    side: BorderSide(color: textButtonColor, width: 3),
                  ),
                ),
                child: Text(
                  'Начать подход',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
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

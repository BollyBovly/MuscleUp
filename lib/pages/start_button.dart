import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
      child: ElevatedButton(
        onPressed: () => {Navigator.of(context).pushNamed('/start')},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFFFFF),
          minimumSize: Size(130, 70),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
            side: BorderSide(color: textButtonColor, width: 3),
          ),
        ),
        child: Text(
          'Старт',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: textButtonColor,
          ),
        ),
      ),
    );
  }
}

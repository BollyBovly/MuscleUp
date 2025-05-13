import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class StartButton extends StatelessWidget{
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: elevationColor, // Shadow color with opacity
            spreadRadius: 0.25, // Spread value
            blurRadius: 10, // Blur value
            offset: Offset(0, 0), // Offset (horizontal, vertical)
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => {Navigator.of(context).pushNamed('/start')}, //временное решение, потом нужно вернуть /start
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFFFFF),
          minimumSize: Size(100, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 20,
        ),
        child: Text(
          'Старт',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: textButtonColor
          )
        ),  
      ),
    );
  }
}
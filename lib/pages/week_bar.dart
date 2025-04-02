import 'package:flutter/material.dart';
import 'package:musleapp/design/Colors.dart';
import 'package:musleapp/pages/circle_widget.dart';


class Weekbar extends StatelessWidget{
  const Weekbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 25,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 191, 191, 191), // Shadow color with opacity
              spreadRadius: 0.25, // Spread value
              blurRadius: 10, // Blur value
              offset: Offset(0, 0), // Offset (horizontal, vertical)
            ),
          ],
          borderRadius: BorderRadius.horizontal(right: Radius.circular(50.0)),
          color: weekBarColor,
        ),
        
        child: CircleWidget()
      ),
    );
  }
}
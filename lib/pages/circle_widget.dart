import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft, child: Container(
      width: MediaQuery.of(context).size.width - 50,  // Ширина контейнера
      height: 25,  // Высота контейнера
      decoration: BoxDecoration(
        color: interfaceColor, // Фоновый цвет полосы
        borderRadius: BorderRadius.all(Radius.circular(50)), // Закругление слева
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(7, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: circleColor, // Цвет кругов
            ),
          );
        }
      ))
    ));
  }
}       
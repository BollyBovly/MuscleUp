import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/pages/weight_widget.dart';


class TrainingScreen extends StatelessWidget{
  final int reps;
  final int sets;
  final String name;
  const TrainingScreen({super.key, required this.reps, required this.sets, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      color: backgroundColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),
            )
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.width - 160,
              decoration: BoxDecoration(
                // color: interfaceColor,
                borderRadius: BorderRadius.circular(30),
                // boxShadow: [
                //   BoxShadow(
                //     color: timerColor, // Shadow color with opacity
                //     spreadRadius: 2, // Spread value
                //     blurRadius: 10, // Blur value
                //     offset: Offset(0, 0), // Offset (horizontal, vertical)
                //   ),
                // ],
              ),
              child: Image.asset('lib\\assets\\gifs\\$name.gif')
              
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width - 70,
              height: MediaQuery.of(context).size.width - 254,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        'Количество повторений: $reps',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Количество подходов: $sets',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  )
                ],
              )
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
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
              onPressed: () => {Navigator.of(context).pushNamed('/timer')},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFFFF),
                minimumSize: Size(MediaQuery.of(context).size.width - 180, MediaQuery.of(context).size.width - 310),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: Text(
                'Отдых',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: textButtonColor
                )
              ),  
            ),
          ),
          WeightInputWidget(task: 'ex-weight'),
        ],
      )
    );
  }
}
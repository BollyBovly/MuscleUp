import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';


class TrainingOver extends StatelessWidget{
  const TrainingOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тренировка окончена!'),
        backgroundColor: backgroundColor,
        leading: Align(alignment: Alignment.centerRight, child: Builder(
          builder: (context){
            return IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                alignment: Alignment.center,
            );
          }
        ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        color: backgroundColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Теперь можно и подкрепиться! \n\n Варианты можешь найти в разделе "Еда" в главном меню',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: textButtonColor,
                       
                    )
                  )
                )
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(top: 40),
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
                onPressed: () => {Navigator.of(context).pushNamed('/home')},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),
                  minimumSize: Size(MediaQuery.of(context).size.width - 150, MediaQuery.of(context).size.width - 300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                ),
                child: Text(
                  'Отлично!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: textButtonColor
                  )
                ),  
              ),
            ),
          ],
        )
      ),
    );
  }
}
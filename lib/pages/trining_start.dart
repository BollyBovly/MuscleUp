import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class TriningStart extends StatelessWidget{
  const TriningStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Название упражнения'),
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
                margin: EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.width - 130,
                decoration: BoxDecoration(
                  color: interfaceColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: timerColor, // Shadow color with opacity
                      spreadRadius: 2, // Spread value
                      blurRadius: 10, // Blur value
                      offset: Offset(0, 0), // Offset (horizontal, vertical)
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Builder(
                    builder: (context){
                      return IconButton(
                        onPressed: () => {print('video is playing!')},
                        icon: const Icon(Icons.play_arrow),
                        alignment: Alignment.center,
                        iconSize: 60,
                      );
                    },
                  )
                ),
                
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
                          'Количество повторений: 15',
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
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          'Количество подходов: 3',
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
              margin: EdgeInsets.only(top: 60),
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
                  minimumSize: Size(MediaQuery.of(context).size.width - 150, MediaQuery.of(context).size.width - 300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 20,
                ),
                child: Text(
                  'Начать подход',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
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
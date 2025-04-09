import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/pages/dishes_menu.dart';
import 'package:musleapp/pages/start_button.dart';
import 'package:musleapp/pages/training_description.dart';
import 'package:musleapp/pages/week_bar.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "1-я неделя, Суббота",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: backgroundColor,
        leading: Align(alignment: Alignment.centerRight, child: Builder(
          builder: (context){
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.reorder),
                alignment: Alignment.center,
            );
          }
        ),
        )
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        child: new Column(
          children: [
            Weekbar(),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'Название тренировки',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 22,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'Описание',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )
                )
              ) 
            ),
            TrainingDescription(),
            StartButton(),
            DishesMenu(),
          ]
        )
      ),
    );
  }
  //
  //хуй
}
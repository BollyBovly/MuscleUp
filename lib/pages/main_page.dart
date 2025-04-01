import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/pages/week_bar.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1-я неделя, Суббота"),
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
                  fontSize: 20
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 22,
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'Описание',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20
                  )
                )
              ) 
            ),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 160,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        'Это я - твой единственный зритель. Я на протяжении многих лет создавал  иллюзию того, что тебя смотрят много людей, но это был я. Сейчас напишу  это сообщение со всех аккаунтов.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16
                        )
                      ),
                    )
                  ],
                )
              )
            ),
            ElevatedButton(
              onPressed: () => {print('Clicked!!!')},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFFFF),
                minimumSize: Size(100, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Старт',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0)
                )
              ),  
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width - 60,
              height: 330,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 25,
                      //color: Color.fromARGB(255, 0, 0, 0),
                      child: Text(
                        'Вот, что можно приготовить сегодня:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16
                        ),
                      )
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 90,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: interfaceColor,
                        ),
                        child: Row(children: [
                          Align( 
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: weekBarColor,
                              ),
                              child: Text(
                                'Тут есть картинка',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                            )
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.all(5),
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                //color: weekBarColor,
                              ),
                              child: Text(
                                'Это я - твой единственный зритель',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 90,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: interfaceColor,
                        ),
                        child: Row(children: [
                          Align( 
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: weekBarColor,
                              ),
                              child: Text(
                                'Тут есть картинка',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                            )
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.all(5),
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                //color: weekBarColor,
                              ),
                              child: Text(
                                'Это я - твой единственный зритель',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 90,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: interfaceColor,
                        ),
                        child: Row(children: [
                          Align( 
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: weekBarColor,
                              ),
                              child: Text(
                                'Тут есть картинка',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                            )
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.all(5),
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                //color: weekBarColor,
                              ),
                              child: Text(
                                'Это я - твой единственный зритель',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  )
                ],
              )
            )
          ]
        )
      ),
    );
  }
  
}
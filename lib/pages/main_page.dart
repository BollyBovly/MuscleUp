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
                  fontSize: 20
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
                    fontSize: 20
                  )
                )
              ) 
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
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
            Container(
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
                onPressed: () => {print('Clicked!!!')},
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
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 0, 0, 0)
                  )
                ),  
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width - 60,
              height: 330,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: elevationColor, // Shadow color with opacity
                              spreadRadius: 0.25, // Spread value
                              blurRadius: 10, // Blur value
                              offset: Offset(0, 0), // Offset (horizontal, vertical)
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: circleColor,
                        ),
                        child: Row(children: [
                          Align( 
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: const Color.fromARGB(255, 239, 237, 237),
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
                              margin:EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                //color: weekBarColor,
                              ),
                              child: Text(
                                'Пицца паста пепперони \nВремя готовки: 40 мин.\nСложность: 2/5',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: elevationColor, // Shadow color with opacity
                              spreadRadius: 0.25, // Spread value
                              blurRadius: 10, // Blur value
                              offset: Offset(0, 0), // Offset (horizontal, vertical)
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: circleColor,
                        ),
                        child: Row(children: [
                          Align( 
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: const Color.fromARGB(255, 239, 237, 237),
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
                              margin:EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                //color: weekBarColor,
                              ),
                              child: Text(
                                'Пицца паста пепперони \nВремя готовки: 40 мин.\nСложность: 2/5',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: elevationColor, // Shadow color with opacity
                              spreadRadius: 0.25, // Spread value
                              blurRadius: 10, // Blur value
                              offset: Offset(0, 0), // Offset (horizontal, vertical)
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: circleColor,
                        ),
                        child: Row(children: [
                          Align( 
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: const Color.fromARGB(255, 239, 237, 237),
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
                              margin:EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                              width: 190,
                              height: 60,
                              decoration: BoxDecoration(
                                //color: weekBarColor,
                              ),
                              child: Text(
                                'Пицца паста пепперони \nВремя готовки: 40 мин.\nСложность: 2/5',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14
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
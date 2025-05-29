import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';

class DishesMenu extends StatelessWidget{
  const DishesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
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
                        
                      ),
                      child: Image.asset('lib\\assets\\food\\Овсянка с греческим йогуртом и бананом.jpg'),
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
                        'Овсянка с греческим йогуртом и бананом \nВремя готовки: 10 мин.',
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
                        
                      ),
                      child: Image.asset('lib\\assets\\food\\Рис с курицей и салат айсберг.jpg'),
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
                        'Рис с курицей и салат айсберг \nВремя готовки: 40 мин.',
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
                        
                      ),
                      child: Image.asset('lib\\assets\\food\\Творог с ягодами или орехами.jpg'),
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
                        'Творог с ягодами или орехами \nВремя готовки: 10 мин.',
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
    );
  }
}
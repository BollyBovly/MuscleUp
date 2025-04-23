import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget{
  const ChartWidget({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChartWidgetState();
  }
}

class _ChartWidgetState extends State<ChartWidget>{
  List<String> chart_titles = ['', 'Жим лёжа', 'Становая тяга', 'Присед со штангой'];
  String chart_title = 'Вес';
  List<ChartData> data = [
    ChartData('1-я неделя', 0),
    ChartData('2-я неделя', 0),
    ChartData('3-я неделя', 0),
    ChartData('4-я неделя', 0),
    ChartData('5-я неделя', 0),
    ChartData('6-я неделя', 0),
    ChartData('7-я неделя', 0),
  ];

  void UpdateTitle(int _title){
    setState(() {
      chart_title = chart_titles[_title];
    });
  }

  void UpdateData(List<ChartData> _data){
    setState(() {
      data = _data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 340,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Align(
          alignment: Alignment.center,
          child: DropdownMenu(
            
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
            ),
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 1, label: 'Жим лёжа', style: MenuItemButton.styleFrom(backgroundColor: backgroundColor)),
              DropdownMenuEntry(value: 2, label: 'Становая тяга', style: MenuItemButton.styleFrom(backgroundColor: backgroundColor)),
              DropdownMenuEntry(value: 3, label: 'Присед со штангой', style: MenuItemButton.styleFrom(backgroundColor: backgroundColor)),
            ],
            onSelected: (value) => {
              UpdateTitle(value!),
              UpdateData(
                [
                  ChartData('1-я неделя', 90 * value),
                  ChartData('2-я неделя', 89 * value + 1),
                  ChartData('3-я неделя', 89 * value + 15),
                  ChartData('4-я неделя', 90 * value),
                  ChartData('5-я неделя', 90 * value + 1),
                  ChartData('6-я неделя', 91 * value + 15),
                  ChartData('7-я неделя', 92 * value),
                ]
              )
            }
          )
        ),
        Align(
          alignment: Alignment.center,
          child: 
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            margin: EdgeInsets.only(top: 20),
            child: SfCartesianChart(
              title: ChartTitle(text: chart_title),
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                LineSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y
                )
              ]
            )
          )
        )
        ],
      )
        
    );
  }
}
import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/models/chart_data.dart';
import 'package:musleapp/pages/chart_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Статистика'),
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
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: 
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: SfCartesianChart(
                  title: ChartTitle(text: 'Вес'),
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries>[
                    LineSeries<ChartData, String>(
                      dataSource: [
                          // Bind data source
                          ChartData('1-я неделя', 90),
                          ChartData('2-я неделя', 90),
                          ChartData('3-я неделя', 89),
                          ChartData('4-я неделя', 90),
                          ChartData('5-я неделя', 90),
                          ChartData('6-я неделя', 91),
                          ChartData('7-я неделя', 92),
                      ],
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                    )
                  ]
                )
              )
            ),
            ChartWidget()
          ],
        )
        
      )
    );
  }
}

class Title{
  static String chartName = 'Вес';

  void UpdateName(String name){
    chartName = name;
  }
}

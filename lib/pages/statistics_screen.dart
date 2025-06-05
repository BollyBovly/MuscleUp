import 'package:flutter/material.dart';
import 'package:musleapp/api/api_server.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/models/chart_data.dart';
import 'package:musleapp/pages/chart_widget.dart';
import 'package:musleapp/services/data_serializer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StatisticsScreenState();
  }
}

class StatisticsScreenState extends State<StatisticsScreen>{
  Future<List<dynamic>>? weight;
   late SelectionBehavior _selectionBehavior;
   

  @override
  void initState() {
    super.initState();
    //ApiService.addUserBodyWeight(90); 
    weight = ApiService.getUserBodyWeight(); 
    _selectionBehavior = SelectionBehavior(
      enable: true,
      selectedColor: const Color.fromARGB(255, 134, 10, 10), // цвет выбранной точки
    );
    
  }

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
      body: FutureBuilder<List<dynamic>>(
        future: weight,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Индикатор загрузки
          } else if (snapshot.hasError) {
            return Text('Ошибка: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('Нет доступных упражнений');
          } else {
            List<dynamic> weightList = snapshot.data!;

              return Container(
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
                        tooltipBehavior: TooltipBehavior(
                          enable: true,
                          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                            final ChartData item = data as ChartData;

                            return Container(
                              width: 160,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 204),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, color: Colors.white, size: 14),
                                      const SizedBox(width: 6),
                                      Text('Дата: ${item.x}', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.balance, color: Colors.white, size: 14),
                                      const SizedBox(width: 6),
                                      Text('Вес: ${item.y} кг', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        
                        series: <CartesianSeries>[
                          LineSeries<ChartData, String>(
                            name: '',
                            dataSource: DataSerializer.serialize(weightList[0]['progress']),
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            color: Colors.red,
                            enableTooltip: true,
                            selectionBehavior: _selectionBehavior,
                            markerSettings: MarkerSettings(
                              isVisible: true,
                              width: 6,  // обычный размер точки
                              height: 6,
                              borderWidth: 2,
                              shape: DataMarkerType.circle,
                            ),
                          )
                        ]
                      )
                    )
                  ),
                  ChartWidget()
                ],
              )
              
            );
          }
        }
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

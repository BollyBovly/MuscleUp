import 'package:flutter/material.dart';
import 'package:musleapp/api/api_server.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/models/chart_data.dart';
import 'package:musleapp/services/data_serializer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChartWidgetState();
  }
}

class _ChartWidgetState extends State<ChartWidget> {
  Future<List<dynamic>>? exercises;

  List<String> chart_titles = [
    '',
    'Жим лёжа',
    "Бабочка",
    "Тяга верхнего блока",
    "Пулловер",
    "Присед-гак-присед",
    "Разгибание ног в тренажере",
    "Жим штанги/гантелей в наклоне",
    "Жим в хаммере",
    "Тяга нижнего блока к поясу",
    "Тяга гантелей с упором в скамью",
    "Румынская тяга с гантелями/штангой",
    "Сгибание ног в тренажере",
    "Брусья",
    "Махи с гантелями в сторону",
    "Подтягивания",
    "Сгибание рук со штангой/гантелями",
    "Tricep Pushdown"
  ];
  String chart_title = '';
  List<ChartData> data = [
    ChartData('1-я неделя', 0),
    ChartData('2-я неделя', 0),
    ChartData('3-я неделя', 0),
    ChartData('4-я неделя', 0),
    ChartData('5-я неделя', 0),
    ChartData('6-я неделя', 0),
    ChartData('7-я неделя', 0),
  ];

  late SelectionBehavior _selectionBehavior;

  @override
  void initState() {
    super.initState();
    exercises = ApiService.getExercises(); // Загружаем упражнения при инициализации
    _selectionBehavior = SelectionBehavior(
      enable: true,
      selectedColor: const Color.fromARGB(255, 134, 10, 10), // цвет выбранной точки
    );
  }

  void UpdateTitle(int _title) {
    setState(() {
      chart_title = chart_titles[_title];
    });
  }

  void UpdateData(List<ChartData> _data) {
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
          FutureBuilder<List<dynamic>>(
            future: exercises,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Индикатор загрузки
              } else if (snapshot.hasError) {
                return Text('Ошибка: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('Нет доступных упражнений');
              }

              List<dynamic> exercisesList = snapshot.data!;

              return Align(
                alignment: Alignment.center,
                child: PopupMenuButton<int>(
                  color: backgroundColor,
                  tooltip: 'Выберите упражнение',
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                      color: backgroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          chart_title,
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  onSelected: (int index) {
                    setState(() {
                      chart_title = chart_titles[index + 1];
                      UpdateData(DataSerializer.serialize(exercisesList[index]["progress"]));
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    // Ограничиваем высоту меню и делаем прокручиваемым
                    return [
                      PopupMenuItem(
                        enabled: false,
                        child: Container(
                          width: 250,
                          height: 200, // высота меню с прокруткой
                          color: backgroundColor,
                          child: Scrollbar(
                            
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: exercisesList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: EdgeInsets.all(0),
                                  tileColor: backgroundColor,
                                  title: Text(
                                    exercisesList[index]['name'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context, index);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              margin: EdgeInsets.only(top: 20),
              child: SfCartesianChart(
                title: ChartTitle(text: chart_title),
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
                              Icon(Icons.fitness_center, color: Colors.white, size: 14),
                              const SizedBox(width: 6),
                              Text('Вес: ${item.y} кг', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                primaryXAxis: CategoryAxis(),
                series: <CartesianSeries>[
                  LineSeries<ChartData, String>(
                    name: '',
                    dataSource: data,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
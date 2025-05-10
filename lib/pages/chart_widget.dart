import 'package:flutter/material.dart';
import 'package:musleapp/api/api_server.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/models/chart_data.dart';
import 'package:musleapp/services/data_serializer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatefulWidget{
  const ChartWidget({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ChartWidgetState();
  }
}

class _ChartWidgetState extends State<ChartWidget>{
  Future<List<dynamic>>? exercises;

  List<String> chart_titles = ['', 'Жим лёжа', "Бабочка", "Жим штанги/гантелей в наклоне", "Жим в хаммере", "Брусья", "Тяга верхнего блока", "Пулловер", "Тяга нижнего блока к поясу", "Тяга гантелей с упором в скамью", "Подтягивания", "Сгибание рук со штангой/гантелями", "Tricep Pushdown", "Махи с гантелями в сторону", "Присед/гак-присед", "Разгибание ног в тренажере", "Румынская тяга с гантелями/штангой", "Сгибание ног в тренажере"];
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

  @override
  void initState() {
    super.initState();
    exercises = ApiService.getExercises(); // Загружаем упражнения при инициализации
  }

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

              // Получаем список упражнений
              List<dynamic> exercisesList = snapshot.data!;
              return Align(
                alignment: Alignment.center,
                child: DropdownMenu(
                  menuStyle: MenuStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
                  ),
                  dropdownMenuEntries: exercisesList.map((exercise) {
                    return DropdownMenuEntry(
                      value: exercise['id'], // Предполагается, что у вас есть поле 'id'
                      label: exercise['name'], // Предполагается, что у вас есть поле 'name'
                      style: MenuItemButton.styleFrom(backgroundColor: backgroundColor),
                    );
                  }).toList(),
                  onSelected: (value) {
                    chart_title = chart_titles[value];
                    UpdateData(DataSerializer.serialize(exercisesList[value - 1]["progress"])); // Получаем данные о прогрессе для выбранного упражнения
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
                primaryXAxis: CategoryAxis(),
                series: <CartesianSeries>[
                  LineSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
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
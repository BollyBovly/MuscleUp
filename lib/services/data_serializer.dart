import 'package:musleapp/models/chart_data.dart';

class DataSerializer{

  static List<ChartData> serialize(List<dynamic> progress){
    List<ChartData> prog = [];

    for (final progr in progress){
      prog.add(ChartData(progr['date'], progr['weight']));
      // for (final progItem in progr['progress']){
      //   prog.add(ChartData(progItem['date'], progItem['weight']));
      // }
    }

    return prog;
  }
}
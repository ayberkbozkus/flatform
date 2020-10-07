import 'package:flatform/widgets/charts/energy_charts.dart';
import 'package:flatform/widgets/charts/productivity_charts.dart';
import 'package:flatform/widgets/charts/total_manufacturing_charts.dart';
import 'package:flatform/widgets/charts/working_situation_chats.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class addCharts {
  final String label;
  final int values;
  addCharts(this.label, this.values);
}

class Task {
  String task;
  double taskvalue;
  Task(this.task, this.taskvalue);
}

class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}

charts.Color getChartColor(Color color) {
    return charts.Color(
        r: color.red,
        g: color.green,
        b: color.blue,
        a: color.alpha);
}


Widget productivitychartselector(String location) {
  return ProductivityChart(location: location);
}

Widget energychartselector(String location) {
  return EnergyChart(location: location);
  
}

Widget workingsituationchartselector(String location) {
    return WorkingSituationChart(location: location);
}

Widget totalmanufacturingChart(String location) {
  return TotalManufacturingChart(location: location);
  
}
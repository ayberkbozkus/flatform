import 'package:flatform/widgets/charts/facility_charts.dart';
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


Widget facilitychartselector(String location) {
  if(location.startsWith('Tür')){
    return FacilityT1Chart();
  }else if(location.startsWith('Ro')){
    return FacilityT1Chart();
  }else if(location.startsWith('T')){
    return FacilityT1Chart();
  }else if(location.startsWith('E')){
    return FacilityT1Chart();
  }else {
    return null;
  }
}

Widget energychartselector(String location) {
  if(location.startsWith('Tür')){
    return FacilityT1Chart();
  }else if(location.startsWith('Ro')){
    return FacilityT1Chart();
  }else if(location.startsWith('T')){
    return FacilityT1Chart();
  }else if(location.startsWith('E')){
    return FacilityT1Chart();
  }else {
    return null;
  }
}

Widget workingsituationchartselector(String location) {
  if(location.startsWith('Tür')){
    return FacilityT1Chart();
  }else if(location.startsWith('Ro')){
    return FacilityT1Chart();
  }else if(location.startsWith('T')){
    return FacilityT1Chart();
  }else if(location.startsWith('E')){
    return FacilityT1Chart();
  }else {
    return null;
  }
}

Widget totalmanufacturingChart(String location) {
  if(location.startsWith('Tür')){
    return FacilityT1Chart();
  }else if(location.startsWith('Ro')){
    return FacilityT1Chart();
  }else if(location.startsWith('T')){
    return FacilityT1Chart();
  }else if(location.startsWith('E')){
    return FacilityT1Chart();
  }else {
    return null;
  }
}
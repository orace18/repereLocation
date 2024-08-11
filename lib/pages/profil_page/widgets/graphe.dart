import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kimo/helpers/constantes.dart';

class PieChartComposant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: kimoBlue,
                value: 60,
                title: '',
                radius: 50,
              ),
              PieChartSectionData(
                color: Colors.orangeAccent,
                value: 20,
                title: '',
                radius: 50,
              ),
              PieChartSectionData(
                color: Colors.teal,
                value: 20,
                title: '',
                radius: 50,
              ),
            ],
            sectionsSpace: 0, // Space between the sections
            centerSpaceRadius: 40, // Empty center space
            borderData: FlBorderData(show: false),
          ),
        ),
      ),
    );
  }
}



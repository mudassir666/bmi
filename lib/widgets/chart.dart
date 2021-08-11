import 'package:bmi/models/Bmi_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  //const Chart({Key? key}) : super(key: key);

  final List<BmiModel> _bmiData;

  Chart(this._bmiData);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<BmiModel> _chartData;

  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  List<BmiModel> getChartData() {
    return widget._bmiData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(4),
      height: 200,
      child: Card(
        elevation: 6,
        child: SafeArea(
          child: SfCartesianChart(
            // title:ChartTitle(text: "BMI CHART") ,
            // legend: Legend(isVisible: true),
            series: <ChartSeries>[
              LineSeries<BmiModel, double>(
                  dataSource: _chartData,
                  xValueMapper: (BmiModel id, _) => id.increment,
                  yValueMapper: (BmiModel id, _) => id.bmi,
                  dataLabelSettings: DataLabelSettings(isVisible: true,))
            ],
          ),
        ),
      ),
    );
  }
}

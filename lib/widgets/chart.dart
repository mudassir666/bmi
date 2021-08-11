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
            series: <ChartSeries>[
              LineSeries<BmiModel,double>(dataSource: _chartData, xValueMapper: (BmiModel id, _) => id.increment,
              yValueMapper: (BmiModel id,_) =>id.bmi )
            ],
          ),
        ),
      ),
    );
  }
}


// static List<LineSeries<SalesData, num>> getDefaultData() {
//    final List<SalesData> chartData = <SalesData>[
//      SalesData(DateTime(2005, 0, 1), 'India', 1.5, 21, 28, 680, 760),
//      SalesData(DateTime(2006, 0, 1), 'China', 2.2, 24, 44, 550, 880),
//      SalesData(DateTime(2007, 0, 1), 'USA', 3.32, 36, 48, 440, 788),
//      SalesData(DateTime(2008, 0, 1), 'Japan', 4.56, 38, 50, 350, 560),
//      SalesData(DateTime(2009, 0, 1), 'Russia', 5.87, 54, 66, 444, 566),
//      SalesData(DateTime(2010, 0, 1), 'France', 6.8, 57, 78, 780, 650),
//     SalesData(DateTime(2011, 0, 1), 'Germany', 8.5, 70, 84, 450, 800)
//    ];
//   return <LineSeries<SalesData, num>>[
//      LineSeries<SalesData, num>(
//          enableToolTip: isTooltipVisible,
//          dataSource: chartData,
//          xValueMapper: (SalesData sales, _) => sales.numeric,
//          yValueMapper: (SalesData sales, _) => sales.sales1,
//          width: lineWidth ?? 2,
//          enableAnimation: false,
//         markerSettings: MarkerSettings(
//              isVisible: isMarkerVisible,
//              height: markerWidth ?? 4,
//              width: markerHeight ?? 4,
//              shape: DataMarkerType.Circle,
//              borderWidth: 3,
//              borderColor: Colors.red),
//          dataLabelSettings: DataLabelSettings(
//              visible: isDataLabelVisible, position: ChartDataLabelAlignment.Auto)),
//      LineSeries<SalesData, num>(
//          enableToolTip: isTooltipVisible,
//          dataSource: chartData,
//          enableAnimation: false,
//          width: lineWidth ?? 2,
//          xValueMapper: (SalesData sales, _) => sales.numeric,
//          yValueMapper: (SalesData sales, _) => sales.sales2,
//          markerSettings: MarkerSettings(
//              isVisible: isMarkerVisible,
//              height: markerWidth ?? 4,
//              width: markerHeight ?? 4,
//              shape: DataMarkerType.Circle,
//              borderWidth: 3,
//              borderColor: Colors.black),
//          dataLabelSettings: DataLabelSettings(
//              isVisible: isDataLabelVisible, position: ChartDataLabelAlignment.Auto))
//    ];
//  }

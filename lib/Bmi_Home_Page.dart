import 'package:bmi/models/Bmi_model.dart';
import 'package:bmi/widgets/bmi_list.dart';
import 'package:bmi/widgets/new_bmi.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<BmiModel> _bmiData = [
    // BmiModel(
    //     id: "1", height: 1.7018, weight: 74, bmi: 25.6, rating: "OverWeight"),
    // BmiModel(
    //     id: "5", height: 1.8018, weight: 64, bmi: 28.7, rating: "UnderWeight"),
  ];

  void _addBmi(double h, double w, double bmi, String r) {
    final addNewBmi = BmiModel(
        id: DateTime.now().toString(),
        height: h,
        weight: w,
        bmi: bmi,
        rating: r);
    setState(() {
      _bmiData.add(addNewBmi);
    });
  }

  void _deleteBmi(String id) {
    setState(() {
      _bmiData.removeWhere((bmi) {
       return bmi.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                color: Colors.blue,
                child: Text(
                  "Chart",
                  textAlign: TextAlign.center,
                )),
            NewBmi(_addBmi),
            BmiList(_bmiData , _deleteBmi),
          ],
        ),
      ),
    );
  }
}

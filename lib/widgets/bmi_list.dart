import 'package:bmi/models/Bmi_model.dart';
import 'package:flutter/material.dart';

class BmiList extends StatelessWidget {
  // const Bmi_List({Key? key}) : super(key: key);
  final List<BmiModel> _bmiData;
  final Function _deleteBmi;

  BmiList(this._bmiData, this._deleteBmi);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: _bmiData.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                  ),
                  Text(
                    "Empty!",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView.builder(
              itemCount: _bmiData.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: FittedBox(
                        child: Text(
                          "BMI",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      radius: 26,
                    ),
                    title: Text(
                      _bmiData[index].bmi.toStringAsFixed(1),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _bmiData[index].rating,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                        onPressed: () => _deleteBmi(_bmiData[index].id),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              }),
    );
  }
}

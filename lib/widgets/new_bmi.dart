import 'package:flutter/material.dart';

class NewBmi extends StatefulWidget {
  // const NewBmi({ Key? key }) : super(key: key);
  final Function addBmi;
  NewBmi(this.addBmi);
  @override
  _NewBmiState createState() => _NewBmiState();
}

class _NewBmiState extends State<NewBmi> {
  final _height = TextEditingController();
  final _weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final _height = TextEditingController();
    // final _weight = TextEditingController();
    void submit() {
      if (_height.text.isEmpty || _weight.text.isEmpty) {
        return;
      }
      print("check 1");
      final h = double.parse(_height.text);
      final w = double.parse(_weight.text);
      final bmi = w / (h * h);

      if (h < 1 || w < 1 || bmi < 1) {
        return;
      }
      print("check 2");
      final rating;
      if (bmi < 18.5) {
        rating = "Underweight";
      } else if (bmi >= 18.5 && bmi < 25) {
        rating = "Normal";
      } else if (bmi >= 25 && bmi < 30) {
        rating = "Overweight";
      } else if (bmi >= 30) {
        rating = "Obesity";
      } else {
        return;
      }
      _weight.clear();
      _height.clear();
      print("check 3");
      widget.addBmi(h, w, double.parse(bmi.toStringAsFixed(1)), rating);

      //  FocusScope.of(context);
      // Navigator.of(context).pop();
    }

    return LayoutBuilder(builder: (ctx, constraints) {
      return Card(
        elevation: 6,
        child: Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: constraints.maxHeight * 0.325,
                      child: TextField(
                        controller: _height,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                          ),
                          labelText: "Height (m)",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: constraints.maxHeight * 0.325,
                      child: TextField(
                        controller: _weight,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColorDark),
                          ),
                          labelText: "Weight (Kg)",
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                height: constraints.maxHeight * 0.3,
                child: ElevatedButton(
                  onPressed: submit,
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColorDark),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

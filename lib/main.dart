import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Bmi_Home_Page.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

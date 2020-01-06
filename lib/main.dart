import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPetDoc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DoctorBoard(title: 'Flutter Demo Home Page'),
    );
  }
}
class DoctorBoard extends StatelessWidget {
  const DoctorBoard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Time to code!")
    );
  }
}
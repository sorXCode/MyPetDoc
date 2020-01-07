import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final doctorCard = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: Color.fromRGBO(114, 23, 87, 1),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              createIcon(Icons.search),
              createIcon(Icons.menu),
            ],
          ),
          space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Mary Jane",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "Veterinarian, GCSE degree",
                    style: TextStyle(color: Colors.white54),
                  )
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/profile_picture.jpg'),
                radius: 40,
              )
            ],
          ),
          space,
        ],
      ),
    );

    final indicators = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        createIndicator("Health", 89, Color.fromRGBO(255, 185, 40, 1)),
        createIndicator("Activity", 70, Colors.purple)
      ],
    );

    var lastAppointment = Text(
      "Last Appointments",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );

    var appointmentHistory = [
      createAppointmentEntry(
        icon: FontAwesomeIcons.syringe,
        color: Colors.purple,
        title: "Injections",
        dateTime: DateTime(2019, 8, 21),
        content: "Koutine vaccinations are given. There are no complications.",
      ),
      createAppointmentEntry(
        icon: FontAwesomeIcons.checkCircle,
        color: Color.fromRGBO(255, 68, 0, 1),
        title: "Control Visit",
        dateTime: DateTime(2019, 6, 12),
        content: "During the routine examination, no diseases were detected.",
      )
    ];

    var setAppointment = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(255, 185, 40, 1)),
      height: 50,
      alignment: Alignment.center,
      child: Text(
        "Set up an appointment.",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
    return MaterialApp(
      title: 'MyPetDoc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // iconTheme: IconThemeData()
      ),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                doctorCard,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 30),
                  height: 450,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      indicators,
                      lastAppointment,
                      ...appointmentHistory,
                      SizedBox(),
                      setAppointment,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  createIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
      size: 30,
    );
  }

  final space = SizedBox(
    height: 30,
  );

  createIndicator(String title, int percent, Color color) {
    final width = 160.0;
    return SizedBox(
      height: 40,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "$percent%",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.all(0),
            width: width,
            lineHeight: 5.0,
            percent: percent / 100,
            backgroundColor: color.withOpacity(0.3),
            progressColor: color,
          ),
        ],
      ),
    );
  }

  createAppointmentEntry(
      {IconData icon,
      String title,
      DateTime dateTime,
      String content,
      Color color}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color.withOpacity(0.09)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              height: 110,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "${dateTime.year}.${dateTime.month}.${dateTime.day}",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    content,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

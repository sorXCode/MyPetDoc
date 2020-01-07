import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPetDoc',
      theme: ThemeData(textTheme: GoogleFonts.mavenProTextTheme()),
      debugShowCheckedModeBanner: false,
      home: VetBoard(),
    );
  }
}

class VetBoard extends StatefulWidget {
  // This widget is the root of your application.
  @override
  VetBoardState createState() => VetBoardState();
}

class VetBoardState extends State<VetBoard> {
  var _selectedIndex = 3;
  final colorElectricViolet = Color.fromRGBO(114, 23, 87, 1);
  final colorYellow = Color.fromRGBO(255, 185, 40, 1);
  final colorVermilion = Color.fromRGBO(255, 68, 0, 1);

  @override
  Widget build(BuildContext context) {
    final doctorCard = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: colorElectricViolet,
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
        createIndicator("Health", 89, colorYellow),
        createIndicator("Activity", 70, colorElectricViolet)
      ],
    );

    final lastAppointment = Text(
      "Last Appointments",
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    );

    final appointmentHistory = Column(
      children: <Widget>[
        createAppointmentEntry(
          icon: FontAwesomeIcons.syringe,
          color: Colors.purple,
          title: "Injections",
          dateTime: DateTime(2019, 8, 21),
          content:
              "Koutine vaccinations are given. There are no complications.",
        ),
        space,
        createAppointmentEntry(
          icon: FontAwesomeIcons.checkCircle,
          color: colorVermilion,
          title: "Control Visit",
          dateTime: DateTime(2019, 6, 12),
          content: "During the routine examination, no diseases were detected.",
        )
      ],
    );

    final setAppointment = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: colorYellow),
      height: MediaQuery.of(context).size.height * 0.08,
      alignment: Alignment.center,
      child: Text(
        "Set up an appointment.",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );

    final bottomNav = BottomNavyBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) => setState(() {
        _selectedIndex = index;
      }),
      items: [
        createBottomItem(icon: FontAwesomeIcons.home, title: "Home"),
        createBottomItem(icon: FontAwesomeIcons.paw, title: "Dogs"),
        createBottomItem(icon: FontAwesomeIcons.bone, title: "Feeds"),
        createBottomItem(icon: FontAwesomeIcons.plus, title: "Vet"),
      ],
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              doctorCard,
              Container(
                height: MediaQuery.of(context).size.height * 0.68,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    indicators,
                    lastAppointment,
                    appointmentHistory,
                    setAppointment,
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNav,
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
    height: 20,
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                "$percent%",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
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
              height: MediaQuery.of(context).size.height * 0.15,
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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      // Forced month to be two 2 characters.
                      Text(
                        "${dateTime.year}.${dateTime.month < 10 ? '0${dateTime.month}' : '${dateTime.month}'}.${dateTime.day}",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  space,
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  createBottomItem({IconData icon, String title}) {
    return BottomNavyBarItem(
      icon: Icon(
        icon,
        color: Colors.purple[100],
      ),
      title: Text(
        title.padLeft(10),
        style: TextStyle(color: Colors.white),
      ),
      activeColor: colorElectricViolet,
    );
  }
}

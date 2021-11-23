import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
      data = ModalRoute.of(context)!.settings.arguments as Map;

    //select background

    String bgImage = data['isDay'] ? 'day.png': 'night.png';
    Color? bgColor = data['isDay'] ? Colors.blue: Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/${bgImage}'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 95.0, 0, 0),
              child: Column(children: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(
                        Icons.edit_location,
                      color:Colors.white,
                    ),
                    label: Text(
                      'Choose Location',
                      style: TextStyle(color: Colors.lightGreenAccent,
                      fontSize: 20.0),

                    )
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 35.0, letterSpacing: 2.0, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 75.0,
                    color: Colors.white
                  ),
                )
              ]),
            ),
          ),
    ));
  }
}

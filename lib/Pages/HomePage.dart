import 'package:flutter/material.dart';
import 'package:portfolio/Body/HomePageBody.dart';
//import '../Navbar/Navbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Colors.orange[400],
              Colors.orangeAccent[700],
              Colors.orange[900]
            ])),
        child: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Navbar(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: HomePageBody(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

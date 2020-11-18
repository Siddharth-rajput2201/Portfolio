import 'package:flutter/material.dart';
import 'package:portfolio/Body/projectsPageBody.dart';

// ignore: camel_case_types
class projectsPage extends StatefulWidget {
  @override
  _projectsPageState createState() => _projectsPageState();
}

// ignore: camel_case_types
class _projectsPageState extends State<projectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
              projectsPageBody(),
              //Navbar(),
            ],
          ),
        ),
      ),
    );
  }
}

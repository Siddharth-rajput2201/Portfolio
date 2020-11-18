import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return DesktopNavbar();
      } else {
        return PhoneNavbar();
      }
    });
  }
}

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
      child: Container(
        //  height: MediaQuery.of(context).size.height,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "SIDDHARTH RAJPUT",
                style: GoogleFonts.barlow(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Text(
                  "HOME",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 15),
                Text(
                  "RESUME",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 15),
                Text(
                  "BLOG",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 15),
                Text(
                  "ABOUT US",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ])
            ]),
      ),
    );
  }
}

class PhoneNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "SIDDHARTH RAJPUT",
          style: GoogleFonts.barlow(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HOME",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 15),
                Text(
                  "RESUME",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 15),
                Text(
                  "BLOG",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(width: 15),
                Text(
                  "ABOUT US",
                  style: GoogleFonts.barlow(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ]),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Pages/projectsPage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets/FadeAnimation.dart';


class HomePageBody extends StatelessWidget {
  void _githublancher() async {
    await launch("https://github.com/Siddharth-rajput2201");
  }

  void _linkdinlancher() async {
    await launch("https://www.linkedin.com/in/siddharth-rajput-8111a1194/");
  }

  void _instalancher() async {
    await launch("https://www.instagram.com/siddharth_rajput22/");
  }

  Widget body(double width) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          FadeAnimation(
            1.0,
            Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      //color:Color.fromRGBO(204, 132, 67, .5),
                      color: Colors.yellowAccent,
                      blurRadius: 35,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/profile_photo.jpeg'),
                  ),
                  //
                  // CircularProfileAvatar(
                  //   "assets/images/profile_photo.jpeg", radius: 80,
                  //   elevation: 20.0,
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "SIDDHARTH RAJPUT",
                    style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 5)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ANDROID DEVELOPER | COMPETITIVE ",
                    style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    " PROGRAMMER ",
                    style: GoogleFonts.barlow(
                        textStyle: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _githublancher,
                        child: Image.asset(
                          "assets/images/github.png",
                          height: 60,
                          width: 60,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: _linkdinlancher,
                        child: Image.asset(
                          "assets/images/linkdin.png",
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: _instalancher,
                        child: Image.asset(
                          "assets/images/instagramicon.png",
                          height: 63,
                          width: 63,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
            1.2,
            Text(
              "© SIDDHARTH RAJPUT ",
              style: GoogleFonts.barlow(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2)),
            ),
          ),
          FadeAnimation(
            1.3,
            Text(
              "EMAIL : RAJPUTSIDDHARTH18@GMAIL.COM",
              style: GoogleFonts.barlow(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2)),
            ),
          ),
        ],
      );
  }

  Widget projectButton(double width ,BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: FadeAnimation(1.0,GestureDetector(
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => projectsPage()));},
            child: Container(
              width: width/2.5,
              height: 55,
              decoration: BoxDecoration(
              // color: Colors.red,
              gradient: LinearGradient(

                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight,
                    // stops: [0.1, 0.3, 0.7, 1],
                    // colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink]
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.red[400], Colors.orange[700]
                    ]
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      //color:Color.fromRGBO(204, 132, 67, .5),
                      color: Colors.yellowAccent,
                      blurRadius: 35,
                    )
                  ]),
              child: Center(child: Text("PROJECTS",textAlign: TextAlign.center,
                style:GoogleFonts.barlow(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 2),)),
            ),
          ),
         ),
        )
      ],
    );
}


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            projectButton(constraints.biggest.width / 2.65 ,context),
            body(constraints.biggest.width / 2.65),
          ],
        );
        // }
      } else {
        return Column(
          children: [
            body(constraints.biggest.width),
            projectButton(constraints.biggest.width /1.10,context)
          ],
        );
      }
    });
  }
}

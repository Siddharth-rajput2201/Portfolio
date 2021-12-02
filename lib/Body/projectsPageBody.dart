import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Widgets/FadeAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

class Panel extends StatefulWidget {
  final String projectName;
  final String imagepath;
  final double width;
  final String githuburl;
  final String downloadurl;
  final String projectDescription;
  final double imageHeight;
  final double imageWidth;

  const Panel(
      {Key key,
      this.projectName,
      this.width,
      this.imagepath,
      this.githuburl,
      this.downloadurl,
      this.imageHeight,
      this.imageWidth,
      this.projectDescription})
      : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  void _urllauncher(String url) async {
    await launch("$url");
  }

  String firstHalf;
  String secondHalf;
  bool flag = true;
  @override
  void initState() {
    if (widget.projectDescription.length > 80) {
      firstHalf = widget.projectDescription.substring(0, 80);
      secondHalf = widget.projectDescription
          .substring(80, widget.projectDescription.length);
    } else {
      firstHalf = widget.projectDescription;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  //color:Color.fromRGBO(204, 132, 67, .5),
                  color: Colors.yellowAccent,
                  blurRadius: 10,
                )
              ]),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        widget.imagepath,
                        height: widget.imageHeight,
                        width: widget.imageWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: RichText(
                        text: TextSpan(
                            text: widget.projectName,
                            style: GoogleFonts.barlow(
                                textStyle: TextStyle(color: Colors.black54),
                                fontSize: 26,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: secondHalf.isNotEmpty
                                ? flag
                                    ? (firstHalf) + "..."
                                    : (firstHalf) + (secondHalf)
                                : firstHalf,
                            style: GoogleFonts.barlow(textStyle: TextStyle(color:Colors.black87)),
                          ),
                          TextSpan(
                            text: secondHalf.isNotEmpty
                                ? flag
                                    ? "show more"
                                    : " show less"
                                : "",
                            style: GoogleFonts.barlow(
                              textStyle: TextStyle(color: Colors.blue),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => setState(
                                    () {
                                      flag = !flag;
                                    },
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _urllauncher(widget.githuburl);
                        },
                        child: Image.asset(
                          "assets/images/github.png",
                          height: 52,
                          width: 52,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _urllauncher(widget.downloadurl);
                        },
                        child: Image.asset(
                          "assets/images/downloadicon.png",
                          height: 57,
                          width: 57,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class projectsPageBody extends StatefulWidget {
  @override
  _projectsPageBodyState createState() => _projectsPageBodyState();
}

// ignore: camel_case_types
class _projectsPageBodyState extends State<projectsPageBody> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 FadeAnimation(
                  1.0,
                  Panel(
                    projectName: 'Hassle Free',
                    width: constraints.biggest.width / 4.5,
                    imageHeight: 170,
                    imageWidth: 170,
                    imagepath: 'assets/images/Hassle_Free_Logo.png',
                    githuburl:
                        'https://github.com/Siddharth-rajput2201/Hassle_Free',
                    downloadurl:
                        'https://drive.google.com/file/d/1hdNKGnny6y5IgCmr6dqJ4qWNcXkN20SP/view?usp=sharing',
                    projectDescription:
                        "It is an Android Application, To Manage your password's It's Front-end is made using Flutter and it's backend is made using flask and utilizing Postgres SQL as it's database. The password are salted , hashed and encrypted securely before storing in database soo that NO ONE CAN ACCESS YOUR PASSWORD EXPECT YOU.",
                  ),
                ),
                FadeAnimation(
                  1.0,
                  Panel(
                    projectName: 'PADHLO APP',
                    width: constraints.biggest.width / 4.5,
                    imageHeight: 150,
                    imageWidth: 150,
                    imagepath: 'assets/images/padhlologo.png',
                    githuburl: 'https://github.com/Siddharth-rajput2201/Padhlo',
                    downloadurl:
                        'https://drive.google.com/file/d/11QEPyipgCh2ux3EBvoGoCr01DvaZ11ut/view?usp=sharing',
                    projectDescription:
                        "It is an Android Application which helps student secure study material across all the courses. This application is made using Futter and back end is made using Node.js utilising Mongo DB as its database.",
                  ),
                ),
                FadeAnimation(
                  1.0,
                  Panel(
                    projectName: 'HOME PRICE PREDICTOR',
                    width: constraints.biggest.width / 4.5,
                    imagepath: 'assets/images/homepricepredictorapplogo.png',
                    githuburl:
                        'https://github.com/Siddharth-rajput2201/Home_Price_Predictor_App',
                    downloadurl:
                        'https://drive.google.com/file/d/1EDV8ZL4WmvAdx0sW56Y_naTP09zZP8ZD/view?usp=sharing',
                    projectDescription:
                        "Predictor is Android Application which predict price of a home by taking simple input of BHK , Location , No. Of Bathroom & Total Area in SQFT. This Application utilizes the power of machine learning to accurately predict the price. Android application is made using Flutter , utilizing flask as it's web framework. Machine Learning Algorithm used Multilinear Regression with an accuracy of 88% .",
                  ),
                ),
                FadeAnimation(
                  1.0,
                  Panel(
                    projectName: 'COVID 19 TRACKER',
                    width: constraints.biggest.width / 4.5,
                    imagepath: 'assets/images/coivd19tracker.png',
                    githuburl:
                        'https://github.com/Siddharth-rajput2201/Covid19_Tracker',
                    downloadurl:
                        'https://drive.google.com/file/d/1KwpL9ikgXcSkhfmc5NNEqlnL23YUtgTN/view?usp=sharing',
                    projectDescription:
                        "This is an Android Application that tracks the Count of People Affected by Novel Covid - 19 . In this application Government Api's has been to provide Correct information.This application is made using Flutter .",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                     FadeAnimation(
                  1.0,
                  Panel(
                    projectName: 'BMI CALCULATOR',
                    width: constraints.biggest.width / 4.5,
                    imagepath: 'assets/images/bmicalculator.png',
                    githuburl:
                        'https://github.com/Siddharth-rajput2201/BMI-Calculaor-App',
                    downloadurl:
                        'https://drive.google.com/file/d/19scktoOD6_-A_86pEnC7aVW0SVlAKWEm/view?usp=sharing',
                    projectDescription:
                        "Flutter Application with beautiful UI ! BMI Calulator App .",
                  ),
                ),
                FadeAnimation(
                  1.0,
                  Panel(
                    imageHeight: 150,
                    projectName: 'XYLOPHONE APP',
                    width: constraints.biggest.width / 4.5,
                    imagepath: 'assets/images/xylophonelogo.png',
                    githuburl:
                        'https://github.com/Siddharth-rajput2201/Xylophone-App',
                    downloadurl:
                        'https://drive.google.com/file/d/16rQVSH-FfeykOmhoHTFk4zxv1ARYAUTZ/view?usp=sharing',
                    projectDescription:
                        "It is an Flutter Application A Copy of Xylophone! Hear The Melody .",
                  ),
                ),
                FadeAnimation(
                  1.0,
                  Container(
                    width: constraints.biggest.width / 4.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            //color:Color.fromRGBO(204, 132, 67, .5),
                            color: Colors.yellowAccent,
                            blurRadius: 10,
                          )
                        ]),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Divider(
                                thickness: 2,
                                color: Colors.grey,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: RichText(
                                  text: TextSpan(
                                      text: "MORE PROJECT's COMING SOON",
                                      style: GoogleFonts.barlow(
                                          textStyle:
                                              TextStyle(color: Colors.black54),
                                          fontSize: 26,
                                          fontWeight: FontWeight.w800)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              child: Divider(
                                thickness: 2,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("STAY TUNED")),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
        // }
      } else {
        return Column(
          children: [
                  FadeAnimation(
                  1.0,
                  Panel(
                    projectName: 'Hassle Free',
                    width: constraints.biggest.width / 1.15,
                    imageHeight: 170,
                    imageWidth: 170,
                    imagepath: 'assets/images/Hassle_Free_Logo.png',
                    githuburl:
                        'https://github.com/Siddharth-rajput2201/Hassle_Free',
                    downloadurl:
                        'https://drive.google.com/file/d/1hdNKGnny6y5IgCmr6dqJ4qWNcXkN20SP/view?usp=sharing',
                    projectDescription:
                        "It is an Android Application ,To Manage your password's It's Front-end is made using Flutter and it's backend is made using flask and utilizing Postgres SQL as it's database. The password are salted , hashed and encrypted securely before storing in database soo that NO ONE CAN ACCESS YOUR PASSWORD EXPECT YOU.",
                  ),
                ),
            FadeAnimation(
              1.0,
              Panel(
                projectName: 'PADHLO APP',
                width: constraints.biggest.width / 1.15,
                imageHeight: 150,
                imageWidth: 150,
                imagepath: 'assets/images/padhlologo.png',
                githuburl: 'https://github.com/Siddharth-rajput2201/Padhlo',
                downloadurl:
                    'https://drive.google.com/file/d/1IJ1B7d-lwgQiGz3BsXFI9Rw5qKYtQkNM/view?usp=sharing',
                projectDescription:
                    "It is an Android Application which helps student secure study material across all the courses. This application is made using Futter and back end is made using Node.js utilising Mongo DB as its database .",
              ),
            ),
            FadeAnimation(
              1.0,
              Panel(
                projectName: 'HOME PRICE PREDICTOR',
                width: constraints.biggest.width / 1.15,
                imagepath: 'assets/images/homepricepredictorapplogo.png',
                githuburl:
                    'https://github.com/Siddharth-rajput2201/Home_Price_Predictor_App',
                downloadurl:
                    'https://drive.google.com/file/d/1EDV8ZL4WmvAdx0sW56Y_naTP09zZP8ZD/view?usp=sharing',
                projectDescription:
                    "Predictor is Android Application which predict price of a home by taking simple input of BHK , Location , No. Of Bathroom & Total Area in SQFT. This Application utilizes the power of machine learning to accurately predict the price. Android application is made using Flutter , utilizing flask as it's web framework. Machine Learning Algorithm used Multilinear Regression with an accuracy of 88% .",
              ),
            ),
            FadeAnimation(
              1.0,
              Panel(
                projectName: 'COVID 19 TRACKER',
                width: constraints.biggest.width / 1.15,
                imagepath: 'assets/images/coivd19tracker.png',
                githuburl:
                    'https://github.com/Siddharth-rajput2201/Covid19_Tracker',
                downloadurl:
                    'https://drive.google.com/file/d/1KwpL9ikgXcSkhfmc5NNEqlnL23YUtgTN/view?usp=sharing',
                projectDescription:
                    "This is an Android Application that tracks the Count of People Affected by Novel Covid - 19 . In this application Government Api's has been to provide Correct information.This application is made using Flutter .",
              ),
            ),
            FadeAnimation(
              1.0,
              Panel(
                projectName: 'BMI CALCULATOR',
                width: constraints.biggest.width / 1.15,
                imagepath: 'assets/images/bmicalculator.png',
                githuburl:
                    'https://github.com/Siddharth-rajput2201/BMI-Calculaor-App',
                downloadurl:
                    'https://drive.google.com/file/d/19scktoOD6_-A_86pEnC7aVW0SVlAKWEm/view?usp=sharing',
                projectDescription:
                    "Flutter Application with beautiful UI ! BMI Calulator App .",
              ),
            ),
            FadeAnimation(
              1.0,
              Panel(
                imageHeight: 150,
                projectName: 'XYLOPHONE APP',
                width: constraints.biggest.width / 1.15,
                imagepath: 'assets/images/xylophonelogo.png',
                githuburl:
                    'https://github.com/Siddharth-rajput2201/Xylophone-App',
                downloadurl:
                    'https://drive.google.com/file/d/16rQVSH-FfeykOmhoHTFk4zxv1ARYAUTZ/view?usp=sharing',
                projectDescription:
                    "It is an Flutter Application A Copy of Xylophone! Hear The Melody .",
              ),
            ),
            FadeAnimation(
              1.0,
              Container(
                width: constraints.biggest.width / 1.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        //color:Color.fromRGBO(204, 132, 67, .5),
                        color: Colors.yellowAccent,
                        blurRadius: 10,
                      )
                    ]),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "MORE PROJECT's COMING SOON",
                                  style: GoogleFonts.barlow(
                                      textStyle:
                                          TextStyle(color: Colors.black54),
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Divider(
                            thickness: 2,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("STAY TUNED")),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}

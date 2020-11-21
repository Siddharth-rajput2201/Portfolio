import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Widgets/FadeAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

class Panel extends StatelessWidget {

  void _urllauncher(String url) async {
    await launch("$url");
  }



  final String projectName;
  final String imagepath;
  final double width;
  final String githuburl;
  final String downloadurl;
  const Panel({Key key, this.projectName ,this.width , this.imagepath ,this.githuburl,this.downloadurl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          width: width,
          decoration : BoxDecoration(
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
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child:Image.asset(imagepath,fit: BoxFit.contain)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left : 12.0 , right: 12.0),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left : 12.0 , right: 12.0),
                      child: RichText(text: TextSpan(
                          text : projectName,
                          style: GoogleFonts.barlow(textStyle: TextStyle(color: Colors.black54) ,fontSize: 26 ,fontWeight: FontWeight.w800)
                      ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left : 12.0 , right: 12.0),
                    child: Divider(thickness: 2,color: Colors.grey,),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                           _urllauncher(githuburl);
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
                        onTap: (){
                          _urllauncher(downloadurl);
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
                FadeAnimation(1.0,Panel(projectName : 'HOME PRICE PREDICTOR', width: constraints.biggest.width / 4.5 ,imagepath: 'assets/images/homepricepredictorapplogo.png', githuburl: 'https://github.com/Siddharth-rajput2201/Home_Price_Predictor_App',downloadurl: 'https://drive.google.com/file/d/1EDV8ZL4WmvAdx0sW56Y_naTP09zZP8ZD/view?usp=sharing'),),
                FadeAnimation(1.0,Panel(projectName : 'COVID 19 TRACKER', width: constraints.biggest.width / 4.5 ,imagepath: 'assets/images/coivd19tracker.png', githuburl: 'https://github.com/Siddharth-rajput2201/Covid19_Tracker',downloadurl: 'https://drive.google.com/file/d/1X5gDFku0dlgBINn65jekwf8vb7OF_-SY/view?usp=sharing'),),
                FadeAnimation(1.0,Panel(projectName : 'BMI CALCULATOR', width: constraints.biggest.width / 4.5 ,imagepath: 'assets/images/bmicalculator.png', githuburl: 'https://github.com/Siddharth-rajput2201/Dice_App',downloadurl: 'https://drive.google.com/file/d/19scktoOD6_-A_86pEnC7aVW0SVlAKWEm/view?usp=sharing'),),
              ],
            ),
          ],
        );
        // }
      } else {
        return Column(
          children: [
            FadeAnimation(1.0,Panel(projectName : 'HOME PRICE PREDICTOR', width: constraints.biggest.width / 1.15 ,imagepath: 'assets/images/homepricepredictorapplogo.png', githuburl: 'https://github.com/Siddharth-rajput2201/Home_Price_Predictor_App',downloadurl: 'https://drive.google.com/file/d/1vaR-AUEsCS6dOKGPhrRFzzh3YsXs28CV/view?usp=sharing'),),
            FadeAnimation(1.0,Panel(projectName : 'COVID 19 TRACKER', width: constraints.biggest.width / 1.15 ,imagepath: 'assets/images/coivd19tracker.png', githuburl: 'https://github.com/Siddharth-rajput2201/Covid19_Tracker',downloadurl: 'https://drive.google.com/file/d/1X5gDFku0dlgBINn65jekwf8vb7OF_-SY/view?usp=sharing'),),
            FadeAnimation(1.0,Panel(projectName : 'BMI CALCULATOR', width: constraints.biggest.width / 1.15 ,imagepath: 'assets/images/bmicalculator.png', githuburl: 'https://github.com/Siddharth-rajput2201/Dice_App',downloadurl: 'https://drive.google.com/file/d/19scktoOD6_-A_86pEnC7aVW0SVlAKWEm/view?usp=sharing'),),
          ],
        );
      }
    });
  }
}

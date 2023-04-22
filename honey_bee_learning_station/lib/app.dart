import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:honey_bee_learning_station/pages/login/login.dart';
import 'package:page_transition/page_transition.dart';
import 'config/palette.dart';
import 'pages/signup/signup.dart';

class HBLS_App extends StatefulWidget {
  const HBLS_App({super.key});

  @override
  State<HBLS_App> createState() => _HBLS_AppState();
}

class _HBLS_AppState extends State<HBLS_App> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // print(screenWidth);
    // print(screenHeight);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Container(
              height: 225,
              width: 228,
              margin: const EdgeInsets.only(top: 150.0, left: 50.0),
              // color: Colors.black,s
              child: Image.asset('assets/images/honey_bee_logo_2.png')),
          Container(
            margin: EdgeInsets.only(
              left: 66,
            ),
            height: 80,
            width: 281,
            child: const Text(
              "Keep your kids safe while learning",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 105, left: 50),
            height: 59,
            width: 59,
            child: FloatingActionButton(
              shape: CircleBorder(),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    // child: signupPage(),
                    child: login(),
                  ),
                );
              },
              backgroundColor: Colors.white,
              child: const Icon(Icons.keyboard_arrow_down),
            ),
          )
        ],
      ),
    );
  }
}

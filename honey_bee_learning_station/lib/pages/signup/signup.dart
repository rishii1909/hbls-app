// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:honey_bee_learning_station/config/palette.dart';
import 'package:honey_bee_learning_station/pages/signup/verify.dart';
import 'package:page_transition/page_transition.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,,
      backgroundColor: AppColors.primaryColor,
      body: Stack(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 158),
            height: 700,
            // height: 800,
            width: 393,
            // color: AppColors.backgroundColor,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                color: AppColors.secondaryColor),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 26, top: 47),
                    child: Text(
                      'Sign up!',
                      style: TextStyle(
                        fontSize: 32,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26.7, vertical: 8.0),
                    child: Text(
                      'Create your account so you can manage and record your child\'s activity',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 63, left: 51, right: 51),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email or phone number',
                        labelText: 'Email/Phone number',
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 15, left: 51.5, right: 51.5),
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a new password',
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 62),
                        child: Text(
                          'Password must be 8 digits',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 51.5),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Re-enter password',
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 134, top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: verifier(),
                          ),
                        );
                      },
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 185, 91, 1),
                        minimumSize: Size(124, 41),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 59, left: 190),
          height: 175,
          width: 201,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 120),
                child: Image.asset(
                  'assets/images/Eclips-bg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Image.asset(
                  'assets/images/Baby-Playing.png',
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

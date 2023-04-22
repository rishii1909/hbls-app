// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:honey_bee_learning_station/config/palette.dart';
import 'package:honey_bee_learning_station/pages/infoScreen/infoScreen.dart';
import 'package:honey_bee_learning_station/providers/authentication_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    bool? _isChecked = false;
    final emailController = TextEditingController();
    final passController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 40, left: 210),
          child: Image.asset(
            'assets/images/PaintBG.png',
            fit: BoxFit.fitWidth,
          ),
        ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 26, top: 47),
                    child: Text(
                      'Welcome back!',
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
                      'Sign in to your account',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 63, left: 51, right: 51),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email or phone number',
                        labelText: 'Email/Phone number',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 41, left: 51.5, right: 51.5),
                    child: TextField(
                      obscureText: true,
                      controller: passController,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.textColor),
                        ),
                        hintText: 'Enter a new password',
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Checkbox(
                          checkColor: AppColors.textColor,
                          activeColor: AppColors.primaryColor,
                          value: _isChecked,
                          onChanged: (bool? newBool) {
                            setState(() {
                              _isChecked = newBool!;
                            });
                          },
                        ),
                      ),
                      Text(
                        'I am a teacher',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 134, top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<AuthenticationProvider>(context,
                                listen: false)
                            .LogintoAccount(
                                emailController.text, passController.text)
                            .whenComplete(() {
                          print(
                              "hahahahahaahahahahahahhahahahahah!!!!!!!!!!! User logged in successfully!!!!");
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: StudentDetailes(),
                                  type: PageTransitionType.rightToLeft));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 185, 91, 1),
                        minimumSize: Size(124, 41),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 59, left: 250),
          height: 200,
          width: 300,
          // color: Colors.black,
          child: Stack(
            children: [
              Container(
                // margin: EdgeInsets.only(left: 35),
                child: Image.asset(
                  'assets/images/PaintBox.png',
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

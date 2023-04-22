// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:honey_bee_learning_station/config/palette.dart';

class verifier extends StatefulWidget {
  const verifier({super.key});

  @override
  State<verifier> createState() => _verifierState();
}

class _verifierState extends State<verifier> {
  @override
  var isVarified = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: (isVarified)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: AppColors.secondaryColor),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Verifying..',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  Text(
                    'Just a moment',
                    style: TextStyle(
                        fontSize: 16, color: AppColors.secondaryColor),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Icon(
                      Icons.done_outline,
                      color: AppColors.secondaryColor,
                      size: 52,
                    ),
                    Text(
                      'Account created successfully!',
                      style: TextStyle(
                          fontSize: 24, color: AppColors.secondaryColor),
                    ),
                    Text(
                      'Ready to onboard...',
                      style: TextStyle(
                          fontSize: 16, color: AppColors.secondaryColor),
                    )
                  ]),
      ),
    );
  }
}

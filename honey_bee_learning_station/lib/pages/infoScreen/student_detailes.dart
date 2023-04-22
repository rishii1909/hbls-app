// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:honey_bee_learning_station/config/palette.dart';

class StudentDetailes extends StatefulWidget {
  const StudentDetailes({super.key});

  @override
  State<StudentDetailes> createState() => _StudentDetailesState();
}

class _StudentDetailesState extends State<StudentDetailes> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    String? ValueChoose;
    List GenderList = ["Male", "Female", "Others"];
    String? ValueColor;
    List ColorList = ["Red", "Green", "Blue", "Yellow"];
    TextEditingController dateInput = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth,
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23),
              child: Text(
                'Student Detailes',
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 23, top: 3),
              child: Text(
                'Please enter your child\'s details',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.042,
                  left: MediaQuery.of(context).size.width * 0.4),
              child: const CircleAvatar(
                backgroundColor: AppColors.textColor,
                child: Text(
                  'A',
                  style: TextStyle(
                    color: AppColors.backgroundColor,
                  ),
                ),
                radius: 40,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 145, top: 4),
              child: Text('Add a picture',
                  style: TextStyle(color: AppColors.textColor, fontSize: 16)),
            ),
            SizedBox(
              height: screenHeight * 0.12,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.0462,
                  left: screenWidth * 0.0936,
                  right: screenWidth * 0.0936,
                ),
                child: TextField(
                  // controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email or phone number',
                    labelText: 'Email/Phone number',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.0936,
                    right: screenWidth * 0.0936,
                    top: screenHeight * 0.0264),
                child: TextField(
                  obscureText: true,
                  // controller: ,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                    ),
                    hintText: 'Enter last name',
                    labelText: 'lastname',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.12,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.0936,
                    right: screenWidth * 0.0936,
                    top: screenHeight * 0.0355),
                child: TextField(
                  controller: dateInput,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    hintText: 'mm/dd/yyyy',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                    ),
                    // icon: Icon(Icons.calendar_today), //icon of text field
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));
                    if (pickedDate != null) {
                      print(pickedDate);
                      setState(() {
                        dateInput.text = pickedDate.toString();
                      });
                    } else {}
                  },
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.0936,
                    right: screenWidth * 0.0936,
                    top: screenHeight * 0.0264),
                child: DropdownButtonFormField(
                  value: ValueChoose,
                  onChanged: (val) {
                    setState(() {
                      ValueChoose = val as String;
                    });
                  },
                  items: GenderList.map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      )).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                    ),
                    hintText: 'Choose your gender',
                    labelText: 'Gender',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.0936,
                    right: screenWidth * 0.0936,
                    top: screenHeight * 0.0264),
                child: DropdownButtonFormField(
                  value: ValueColor,
                  onChanged: (val) {
                    setState(() {
                      ValueColor = val as String;
                    });
                  },
                  items: ColorList.map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      )).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textColor),
                    ),
                    hintText: 'Choose your favorite color',
                    labelText: 'Favorite color',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 134, top: 30),
              child: ElevatedButton(
                onPressed: () {},
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
      ),
    );
  }
}

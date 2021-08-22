import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/AdminSection/Add_Quiz_Question_Screen.dart';
import 'package:quiz_app/AdminSection/QuestionListed.dart';
import 'package:quiz_app/Widgets/CustomButton.dart';

import 'Quiz_Section/QuizScreen.dart';

class SplashWelcomeScreen extends StatefulWidget {
  @override
  _SplashWelcomeScreenState createState() => _SplashWelcomeScreenState();
}

class _SplashWelcomeScreenState extends State<SplashWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60,left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Welcome",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )),
              ),
              SizedBox(height: 10),
              Text('To The Quiz App',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              )
              ),
              Image(
                image: AssetImage('images/logo.jpg'),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 50),
              CustomRoundedButton(
                title: 'Admin Section',
                clickFuction:
                    (){
                  Get.to(()=>QuestionListed());
                },
              ),
              SizedBox(height: 10),
              Text("OR",style: TextStyle(
                fontSize: 16,
              )
                ,),
              SizedBox(height: 10,),
              CustomRoundedButton(
                title: 'Quiz Section',
                clickFuction: (){
                  Get.to(()=>QuizScreen());
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}

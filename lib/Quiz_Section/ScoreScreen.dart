
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/QuestionController.dart';
import 'package:quiz_app/Controller/QuizController.dart';
import 'file:///D:/Course/BSCS/7thSemester/FinalYearProject/FlutterProject/quiz_app/lib/SplashWelcome.dart';
import 'package:quiz_app/Widgets/Constant.dart';
import 'package:quiz_app/Widgets/CustomButton.dart';
import 'package:quiz_app/main.dart';

import 'QuizScreen.dart';
class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() async{

        return true;
      },
      child: Scaffold(
        body: Center(
              child: Container(
                height: 400,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff0f2057).withOpacity(.5),
                        blurRadius: 15)
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Text(
                      "Result",
                      style:  Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Score:",
                          style:  Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.black
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${quizController.numOfCorrectAns}/${questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Color(0xff03cc7b),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Divider(thickness: 1,),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Correct Answers",
                          style:  Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.black
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "${quizController.numOfCorrectAns}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Color(0xff03cc7b),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/QuestionController.dart';
import 'package:quiz_app/Controller/QuizController.dart';
import 'package:quiz_app/Model/QuestionModel.dart';
import 'package:quiz_app/Quiz_Section/Widgets/ShowTimer.dart';
import 'package:quiz_app/Widgets/Constant.dart';

import 'Widgets/Question_CardScreen.dart';
class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    quizController.timeTicker();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff03cc7b),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("Quiz",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xff03cc7b),
            )),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10),
            child: TimerShowScreen(),
          ),
          SizedBox(height: 10),
          Divider(thickness: 1.5),
          SizedBox(height: 10),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
                  () => Center(
                    child: Text.rich(
                TextSpan(
                    text:
                    "Question ${quizController.questionNumber.value}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(),
                    children: [
                      TextSpan(
                        text: "/${questionController.questions.length}",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(),
                      ),
                    ],
                ),
              ),
                  ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: quizController.pageController,
              onPageChanged: (value){
                setState(() {
                  quizController.updateTheQnNum(value);
                  quizController.time.value = value;
                  quizController.timeTicker();
                  print(quizController.time.value);
                });
              },
              itemCount: questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(
                  questionModel: questionController.questions[index]),
            ),
          ),
        ],
      ),
    );
  }
}






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/QuizController.dart';
import 'package:quiz_app/Model/QuestionModel.dart';
import 'package:quiz_app/Quiz_Section/Widgets/QuestionOptions.dart';
import 'package:quiz_app/Widgets/Constant.dart';
class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.questionModel,
  }) : super(key: key);

  final QuestionModel questionModel;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.questionModel.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(),
          ),
          SizedBox(height: 10 / 2),
          ...List.generate(
            widget.questionModel.options.length,
                (index) => QuestionOptionsCard(
              index: index,
              text: widget.questionModel.options[index],
              press: () => quizController.checkAns(widget.questionModel.correctIndex, index),
            ),
          ),
        ],
      ),
    );
  }
}
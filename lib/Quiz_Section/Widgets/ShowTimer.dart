import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/QuizController.dart';
class TimerShowScreen extends StatelessWidget {
  const TimerShowScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70,
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xff03cc7b),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GetBuilder<QuizController>(
          init: QuizController(),
          builder: (controller) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20 / 2),
                child: Center(
                  child: Text("${(controller.animation.value * 60).round()}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                  ),
                )

            );
          },
        ),
      ),
    );
  }
}
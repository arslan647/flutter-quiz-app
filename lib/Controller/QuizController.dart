import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Quiz_Section/ScoreScreen.dart';
import 'package:quiz_app/Widgets/Constant.dart';

class QuizController extends GetxController  with SingleGetTickerProviderMixin{
  static QuizController instance = Get.find();
  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int correctAns;

  int selectedAns;
  RxInt questionNumber = 1.obs;

  int numOfCorrectAns = 0;
  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }
  RxInt time = 0.obs;
  void timeTicker(){
    _animationController =
        AnimationController(duration: Duration(seconds: questionController.questions[time.value].attemptedTime), vsync: this);
    _animation = Tween<double>(begin: questionController.questions[time.value].attemptedTime/60, end: 0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
  }



  void checkAns(int correctIndex, int selectedIndex) {
    _isAnswered = true;
    correctAns = correctIndex;
    selectedAns = selectedIndex;
    if (correctIndex == selectedIndex) numOfCorrectAns++;
    _animationController.stop();
    update();
    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (questionNumber.value != questionController.questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 1), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    questionNumber.value = index + 1;
  }
}
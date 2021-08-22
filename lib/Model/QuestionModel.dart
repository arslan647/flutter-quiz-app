class QuestionModel{
  static const QuesID = "Question Id";
  static const QuesTITLE = "Question";
  static const Options = "Options";
  static const CorrectIndex = "Correct Index";
  static const AttemptedTime = "Attempted Time";

  String id;
  String question;
  List options;
  int correctIndex;
  int attemptedTime;

  QuestionModel({this.id,this.question,this.options,this.correctIndex,this.attemptedTime});

  QuestionModel.fromMap(Map data){
    id = data[QuesID];
    question = data[QuesTITLE];
    options = data[Options];
    correctIndex = data[CorrectIndex];
    attemptedTime = data[AttemptedTime];
  }
}
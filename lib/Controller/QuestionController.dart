import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quiz_app/AdminSection/QuestionListed.dart';
import 'package:quiz_app/Model/QuestionModel.dart';

class QuestionController extends GetxController{
  static QuestionController instance = Get.find();
  CollectionReference ref = FirebaseFirestore.instance.collection('Questions');
  RxList<QuestionModel> questions = RxList<QuestionModel>([]);
  void onReady() {
    super.onReady();
    questions.bindStream(_getQuestions());
  }

  Future<void> addQuestions(String id, String question, List options, int correctIndex, int time) async{
    ref.doc(id).set({
      QuestionModel.QuesID:id,
      QuestionModel.QuesTITLE:question,
      QuestionModel.Options:options,
      QuestionModel.CorrectIndex:correctIndex,
      QuestionModel.AttemptedTime:time,
    }).then((value) {
      Get.snackbar('Successfully', 'New question added successfully');
   Get.to(()=>QuestionListed());
    }).catchError((e){
      Get.snackbar('Failed', '${e.toString()}');
    });
  }
  Stream<List<QuestionModel>> _getQuestions() =>
      ref.snapshots().map((
          query) =>
          query.docs.map((item) => QuestionModel.fromMap(item.data())).toList());

  Future getQuestions() async{
    questions.clear();
   return questions.bindStream(_getQuestions());
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/QuestionController.dart';
import 'package:quiz_app/Model/QuestionModel.dart';
import 'package:quiz_app/Widgets/Constant.dart';

import 'Add_Quiz_Question_Screen.dart';

class QuestionListed extends StatefulWidget {
  @override
  _QuestionListedState createState() => _QuestionListedState();
}

class _QuestionListedState extends State<QuestionListed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
          actions: [
            IconButton(
                onPressed:()=> Get.to(()=>AddQuestions()),
                icon: Icon(Icons.add,
                  color: Color(0xff03cc7b),
                ))
          ],
          leading: IconButton(
            icon: Icon(
          Icons.arrow_back,
          color: Color(0xff03cc7b),
        ),
        onPressed: () {
          Get.back();
        },
      ),
          title: Text("Questions",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff03cc7b),
          )),
      centerTitle: true,
    ),
      body:
      Obx(()=>
       ListView.builder(
          shrinkWrap: true,
          itemCount: questionController.questions.length,
          itemBuilder: (context, index) {
            return  Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question no. ${index+1}',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 7,),
                  Align(
                    alignment:Alignment.centerLeft,
                    child: Text(questionController.questions[index].question,style: TextStyle(
                        fontSize: 15,
                    ),),
                  ),

                  ListView.builder(
                    itemCount: questionController.questions[index].options.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,i){
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                (i+1).toString(),style: TextStyle(
                                  fontSize: 15
                              ),
                              ),
                              SizedBox(width: 20,),
                              Text(
                                questionController.questions[index].options[i],style:TextStyle(
                                  fontSize: 15
                              ),
                              ),
                            ],
                          ),
                        );
                      }),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Correct answer is:',style: TextStyle(
                          fontSize: 15
                      ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                         questionController.questions[index].options[questionController.questions[index].correctIndex],
                      style:TextStyle(
                          fontSize: 15
                      ),
                      ),
                    ],
                  ),
                ),
                  Divider(),
                ],
              ),
            );

          },
        ),
      ),
    );
  }
}

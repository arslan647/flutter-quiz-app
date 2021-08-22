import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Controller/QuestionController.dart';
import 'package:quiz_app/Widgets/Constant.dart';
import 'package:quiz_app/Widgets/CustomButton.dart';
import 'package:quiz_app/Widgets/CustomTextField.dart';

class AddQuestions extends StatefulWidget {
  @override
  _AddQuestionsState createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController _questionTextEditingController = new TextEditingController();
  TextEditingController _questionOptionsTextEditingController = new TextEditingController();
  TextEditingController _timerTextEditingController = new TextEditingController();
  List<String> _options =[];
  int selectedRadio ;
  changeValue(int val) {
    setState(() {
      selectedRadio = val;
    });
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
        title: Text("Add Questions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xff03cc7b),
            )),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
                child:Column(
                  children: [
                    CustomTextFormField(
                      textEditController: _questionTextEditingController,
                      hintText: 'enter question',
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Please enter question';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    CustomTextFormField(
                      textEditController: _timerTextEditingController,
                      hintText: 'enter attempted time in sec',
                      inputFormatter: FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Please fill up the required field';
                        }
                        return null;
                      },
                    ),
                  ],
                )
            ),
            SizedBox(height: 10,),
            Form(
              key: _formKey1,
              child: CustomTextFormField(
                textEditController: _questionOptionsTextEditingController,
                hintText: 'enter question options',
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Please enter question option';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10,),
            CustomRoundedButton(
              title: 'Add Options',
              clickFuction: (){
                if(_formKey1.currentState.validate()){
                  setState(() {
                    _options.add(_questionOptionsTextEditingController.text);
                  });
                  print(_options.length);
                  _questionOptionsTextEditingController.clear();
                }
              },
            ),
            SizedBox(height: 10,),
            _options.length >0? Text("Select correct answer.",
             style: TextStyle(
               fontSize: 16,
             )):Container(),
           _options.length >0? ListView.builder(
             physics: NeverScrollableScrollPhysics(),
             shrinkWrap: true,
             itemCount: _options.length,
               itemBuilder: (context,index){
                 return Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   child: Row(
                     children: [
                       Radio(
                         value: index,
                         groupValue: selectedRadio,
                         activeColor: Colors.green,
                         onChanged: (val) {
                           changeValue(val);
                           print(val.toString());
                         },
                       ),
                       SizedBox(width: 10,),
                       Text(_options[index]),
                     ],
                   ),
                 );
               }
           ):Container(),
            SizedBox(height: 30,),
            CustomRoundedButton(
              title: 'Add Question',
              clickFuction: (){
                if(_options.length<0){
                  Get.snackbar('Warning', 'Please add question options');
                }
               else if(_formKey.currentState.validate() && selectedRadio!=null){
                  questionController.addQuestions(
                      DateTime.now().millisecondsSinceEpoch.toString(),
                      _questionTextEditingController.text,
                      _options,
                      selectedRadio,
                      int.parse(_timerTextEditingController.text)).whenComplete(() {
                    _questionTextEditingController.clear();
                    _timerTextEditingController.clear();
                    Get.back();
                  });
                }
                else{
                  Get.snackbar('Warning', 'Please select question options');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

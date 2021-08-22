import 'package:flutter/material.dart';
class CustomRoundedButton extends StatelessWidget {
  final String title;
  final Function clickFuction;
  const CustomRoundedButton({this.title,this.clickFuction});
  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      child: MaterialButton(
        elevation: 1,
        color: Color(0xff03cc7b),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: clickFuction,
        child:
        Align(
          alignment: Alignment.center,
          child: Text(title, style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),),
        ),
      ),
    );
  }
}
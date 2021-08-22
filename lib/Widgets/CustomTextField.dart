import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
 final TextEditingController textEditController;
  final Function validator;
 final Function onSubmit;
 final String hintText;
 final TextInputType textInputType;
 final int maxLine;
 final int minLine;
 var inputFormatter;
 final int maxLength;
  CustomTextFormField({
    this.textEditController,
    this.hintText,
    this.validator,
   this.inputFormatter,
   this.onSubmit,
   this.textInputType,
    this.maxLine,
    this.minLine,
    this.maxLength
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditController,
      validator: validator,
      inputFormatters: inputFormatter == null ? null : [inputFormatter],
      keyboardType: textInputType,
      minLines: minLine,
      maxLines: maxLine,
      maxLength: maxLength,
      decoration: InputDecoration(
          hintText: hintText,
        border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        contentPadding:
        EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      ),
    );
  }
}
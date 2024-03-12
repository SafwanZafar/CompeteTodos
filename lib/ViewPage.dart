
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class helper {
  static CustomTextField(TextEditingController controller,String text,IconData iconData,bool ishide){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
      child: TextField(
            controller: controller,
            obscureText: ishide,
        decoration: InputDecoration(
          border: OutlineInputBorder(

          ),
          hintText: text,
          suffixIcon: Icon(iconData)

        ),
      ),
    );
  }
}
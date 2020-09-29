import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
final bool obscureText;
final IconData icon;
final String hintText;
final TextEditingController controller;
final TextInputType keyBoardType;

  CustomInput({@required this.obscureText, @required this.icon, @required this.hintText, @required this.controller,@required this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:Colors.white
      ),
      width: 280,
      child: TextField(
        keyboardType: this.keyBoardType,
        controller: this.controller,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          icon:Icon(this.icon),
          hintText: this.hintText,
          border: InputBorder.none
        ),
      ),
    );
  }
}
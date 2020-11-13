import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String contenido;
final Function onPressed;
  const CustomButton({Key key, @required this.contenido,@required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 280,
        child: CupertinoButton(
          color: Colors.lightBlue,
            child: Text(
              this.contenido,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: this.onPressed
            ));
  }
} 
 
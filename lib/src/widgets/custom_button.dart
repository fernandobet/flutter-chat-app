import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String contenido;

  const CustomButton({Key key, @required this.contenido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.lightBlue,
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 280,
        child: CupertinoButton(
            child: Text(
              this.contenido,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {}));
  }
}

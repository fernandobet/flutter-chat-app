import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String titulo;

  const HeaderWidget({Key key, @required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 200,
            child: Image(image: AssetImage('assets/tag-logo.png'))),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(this.titulo,style: TextStyle(fontSize: 23),),
          )
      ],
    );
  }
}

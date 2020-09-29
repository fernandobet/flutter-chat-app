import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabelsPage extends StatelessWidget {
  final String pregunta;
  final String estado;
  final String navegar;

  const LabelsPage({Key key, @required this.pregunta, @required this.estado, @required this.navegar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          child: Text(this.pregunta),
        ),
        Container(
            child: CupertinoButton(
                child: Text(this.estado), onPressed: () {
                  Navigator.pushReplacementNamed(context, navegar);
                })),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  final String uid;
  final String mensaje;
  final AnimationController animationController;
  const MensajePage(
      {Key key,
      @required this.uid,
      @required this.mensaje,
      @required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        child: Container(
            child: this.uid == '123' ? _mensajeEnviado() : _mensajeRecibibo()),
      ),
    );
  }

  Widget _mensajeEnviado() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsetsDirectional.only(top: 10, start: 15),
        child: Text(
          this.mensaje,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.blue[300]),
      ),
    );
  }

  Widget _mensajeRecibibo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsetsDirectional.only(top: 10, start: 15),
        child: Text(
          this.mensaje,
          style: TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey[200]),
      ),
    );
  }
  
}

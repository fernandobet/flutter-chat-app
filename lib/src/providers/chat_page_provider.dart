// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:chat_app/src/pages/mensaje_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPageProvider with ChangeNotifier, DiagnosticableTreeMixin{
  
  bool _escribiendo  = false;
  bool get escribiendo => _escribiendo;

  List<MensajePage> _listamensajes;
  List<MensajePage> get listaMensajes => _listamensajes;

//TODO: Iniciamos valores por default
  iniciarEstado(){
    _escribiendo = false;
    notifyListeners();
  }

//TODO:Cambiamos el estado del status
cambiarEstado(){
  _escribiendo = true;
  notifyListeners();
}

iniciarLista(){
  _listamensajes = [];
  notifyListeners();
}

agregarMensaje(MensajePage mensaje){
_listamensajes.insert(0, mensaje);
notifyListeners();
}

}

class ListaMensajesProvider with ChangeNotifier, DiagnosticableTreeMixin{
  
  List<MensajePage> _listamensajes;
  List<MensajePage> get listaMensajes => _listamensajes;

  iniciarLista(){
    _listamensajes = [];
    notifyListeners();
  }

agregarMensaje(MensajePage mensaje){
_listamensajes.insert(0, mensaje);
notifyListeners();
}

limpiarMensajes(){
  if(_listamensajes==null||_listamensajes.length==0)return;
  for (var item in _listamensajes) {
    item.animationController.dispose();
  }
  notifyListeners();
}

}
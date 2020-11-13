import 'package:chat_app/src/pages/chat_page.dart';
import 'package:chat_app/src/pages/loading_page.dart';
import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/pages/register_page.dart';
import 'package:chat_app/src/pages/usuarios_page.dart';
import 'package:flutter/material.dart';

final Map<String,Widget Function(BuildContext)> rutas = {
  LoginPage.ruta    : (_)=>LoginPage(),
  ChatPage.ruta     : (_)=>ChatPage(),
  RegisterPage.ruta : (_)=>RegisterPage(),
  UsuariosPage.ruta : (_) => UsuariosPage(),
  LoadingPage.ruta  : (_)=>LoadingPage()
};
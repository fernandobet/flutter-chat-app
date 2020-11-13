import 'dart:convert';

import 'package:chat_app/src/enviroments/enviroment.dart';
import 'package:chat_app/src/models/login_response.dart';
import 'package:chat_app/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  UsuarioDb usuario;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

  get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

//TODO: Crear metood estatico para leer el token en alguna parte de la aplicacion
  static Future<String> readToken(String token) async {
    final _storage = new FlutterSecureStorage();
    final _token = await _storage.read(key: 'token');
    return _token;
  }

  //TODO: Crear metodo estatico para borrar token en alguna parte de la aplicacion.
  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    _storage.delete(key: 'token');
  }

  Future<dynamic> registrar(String nombre, String email, String pass) async {
    try {
      this.autenticando = true;
      final data = {'nombre': nombre, 'email': email, 'pass': pass};
      final r = await http.post('${Enviroment.apiURL}/login/new',
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
      if (r.statusCode == 200) {
        final loginResponse = loginResponseFromJson(r.body);
        this.usuario = loginResponse.usuario;
        await this._registrarToken(loginResponse.token);
        return true;
      } else {
        final _r = json.decode(r.body);
        return _r['msg'];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> login(String user, String pass) async {
    try {
      this._autenticando = true;
      final data = {"email": user, "pass": pass};

      final r = await http.post('${Enviroment.apiURL}/login',
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});
      if (r.statusCode == 200) {
        final _loginResponse = loginResponseFromJson(r.body);
        usuario = _loginResponse.usuario;
        await this._registrarToken(_loginResponse.token);
        return true;
      } else {
        final res = json.decode(r.body);
        return res['msg'];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLogedIn() async {
    try {
      final _storage = new FlutterSecureStorage();
      final _token =await _storage.read(key: 'token');

      final r = await http.get('${Enviroment.apiURL}/login/refreshToken',
          headers: {'x-token': _token, 'Content-Type': 'application/json'});
      if (r.statusCode == 200) {
        final loginResponse = loginResponseFromJson(r.body);
        await this._registrarToken(loginResponse.token);      
        return true;
      } else {
        await this._borrarToken();
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _registrarToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<void> _borrarToken() async {
    await _storage.delete(key: 'token');
  }
}

import 'package:chat_app/src/helpers/mostrar_alerta.dart';
import 'package:chat_app/src/models/user_model.dart';
import 'package:chat_app/src/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatelessWidget {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  static final ruta = 'usuarios';
  List<UsuarioDb> usuarios = [
    UsuarioDb(
        nombre: 'Fernando',
        email: 'Fernando@gmail.com',
        uid: '1',
        online: true),
    UsuarioDb(
        nombre: 'Cecy',
        email: 'Cecy@gmail.com',
        uid: '2',
        online: false),
    UsuarioDb(
        nombre: 'Javier',
        email: 'Javier@gmail.com',
        uid: '3',
        online: true),
  ];

  @override
  Widget build(BuildContext context) {
    final _usuario = Provider.of<AuthService>(context,listen: false).usuario;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: CupertinoButton(
            child: Icon(
            Icons.exit_to_app,
            color: Colors.blue[200],
          ), 
            onPressed: (){
              AuthService.deleteToken();
              Navigator.pushReplacementNamed(context, 'loading');
            }),
          title: Text(
            'Bienvenido ${_usuario.nombre}',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.cast_connected,
                  color: Colors.green,
                ))
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: ()=>_refreshContainer,
          child: Container(
            width: double.infinity,
            child: _buildListView(),
          ),
        ));
  }

  void _refreshContainer() async{
    await Future.delayed(Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }

  Widget _buildListView() {
    return ListView.separated(
        itemBuilder: (_, i) => _crearRenglon(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length);
  }

  Widget _crearRenglon(UsuarioDb usuario) {
    return ListTile(
      leading: CircleAvatar(child: Text(usuario.nombre.substring(0, 2))),
      title: Text('${usuario.nombre}'),
      subtitle: Text('${usuario.email}'),
      trailing: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: usuario.online ? Colors.green : Colors.red),
        height: 20,
        width: 20,
      ),
    );
  }
}
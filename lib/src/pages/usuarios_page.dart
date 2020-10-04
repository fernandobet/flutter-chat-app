import 'package:chat_app/src/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatelessWidget {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  static final ruta = 'usuarios';
  List<User> usuarios = [
    User(
        nombre: 'Fernando',
        email: 'Fernando@gmail.com',
        pass: '123',
        uId: '1',
        connect: true),
    User(
        nombre: 'Cecy',
        email: 'Cecy@gmail.com',
        pass: '123',
        uId: '2',
        connect: false),
    User(
        nombre: 'Javier',
        email: 'Javier@gmail.com',
        pass: '123',
        uId: '3',
        connect: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.blue[200],
          ),
          title: Text(
            'Mis chats',
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

  Widget _crearRenglon(User usuario) {
    return ListTile(
      leading: CircleAvatar(child: Text(usuario.nombre.substring(0, 2))),
      title: Text('${usuario.nombre}'),
      subtitle: Text('${usuario.email}'),
      trailing: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: usuario.connect ? Colors.green : Colors.red),
        height: 20,
        width: 20,
      ),
    );
  }
}
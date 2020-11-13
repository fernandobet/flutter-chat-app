import 'package:chat_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  static String ruta = 'loading';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: isLogIn(context),
        builder: (_,__){
          return Center(child: Container(child:Text('Cargando..')),);
        },
      )
    );
  }

Future isLogIn(BuildContext context)async{
 final _provider = Provider.of<AuthService>(context,listen: false);
 final _token = await _provider.isLogedIn();
 if(_token){
   Navigator.pushReplacementNamed(context, 'usuarios');
 }else{
    Navigator.pushReplacementNamed(context, 'login');
 }

}
}
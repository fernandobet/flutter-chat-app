import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/routes/routes_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.ruta,
        routes: rutas,
      ),
    );
  }
}

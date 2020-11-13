import 'package:chat_app/src/pages/chat_page.dart';
import 'package:chat_app/src/pages/loading_page.dart';
import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/providers/chat_page_provider.dart';
import 'package:chat_app/src/routes/routes_page.dart';
import 'package:chat_app/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_)=>ChatPageProvider(),),
    ChangeNotifierProvider(create: (_)=>ListaMensajesProvider()),
    ChangeNotifierProvider(create: (_)=>AuthService(),)
  ],
  child: MyApp(),
)
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoadingPage.ruta,
        routes: rutas,
      ),
    );
  }
}

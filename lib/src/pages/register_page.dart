import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/widgets/custom_button.dart';
import 'package:chat_app/src/widgets/custom_footer.dart';
import 'package:chat_app/src/widgets/custom_input.dart';
import 'package:chat_app/src/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'labels_page.dart';

class RegisterPage extends StatelessWidget {
  static final ruta = 'register';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Color.fromRGBO(246, 246, 246, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HeaderWidget(titulo: 'Registrate'),
                CustomInput(
                  obscureText: false,
                  icon: Icons.person,
                  hintText: 'Nombre',
                  controller: _emailController,
                  keyBoardType: TextInputType.emailAddress,
                ),
                CustomInput(
                  obscureText: false,
                  icon: Icons.email,
                  hintText: 'Correo electronico',
                  controller: _emailController,
                  keyBoardType: TextInputType.emailAddress,
                ),
                CustomInput(
                  obscureText: true,
                  icon: Icons.lock_outline,
                  hintText: 'Contraseña',
                  controller: _passController,
                  keyBoardType: TextInputType.visiblePassword,
                ),
                CustomButton(contenido:'Sign up'),
                LabelsPage(
                  pregunta: '¿Ya tienes una cuenta?',
                  estado: 'Inicia sesion',
                  navegar: LoginPage.ruta,
                ),
                CustomFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

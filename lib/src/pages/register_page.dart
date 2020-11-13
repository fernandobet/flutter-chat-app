import 'package:chat_app/src/helpers/mostrar_alerta.dart';
import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/services/auth_service.dart';
import 'package:chat_app/src/widgets/custom_button.dart';
import 'package:chat_app/src/widgets/custom_footer.dart';
import 'package:chat_app/src/widgets/custom_input.dart';
import 'package:chat_app/src/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'labels_page.dart';

class RegisterPage extends StatelessWidget {
  static final ruta = 'register';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Color.fromRGBO(246, 246, 246, 1),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  HeaderWidget(titulo: 'Registrate'),
                  CustomInput(
                    validator: (valor) {
                      if (valor == "") {
                        return "Datos incorrectos";
                      } else {
                        return null;
                      }
                    },
                    obscureText: false,
                    icon: Icons.person,
                    hintText: 'Nombre',
                    controller: _nombreController,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  CustomInput(
                    validator: (valor) {
                      if (valor == "") {
                        return "Datos incorrectos";
                      } else {
                        return null;
                      }
                    },
                    obscureText: false,
                    icon: Icons.email,
                    hintText: 'Correo electronico',
                    controller: _emailController,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  CustomInput(
                    validator: (valor) {
                      if (valor == "") {
                        return "Datos incorrectos";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    icon: Icons.lock_outline,
                    hintText: 'Contraseña',
                    controller: _passController,
                    keyBoardType: TextInputType.visiblePassword,
                  ),
                  CustomButton(
                    contenido: 'Sign up',
                    onPressed: () async{
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
                       var r = await _provider.registrar(_nombreController.text,
                            _emailController.text, _passController.text);
                       if(r==true){
                         Navigator.pushReplacementNamed(context, 'usuarios');

                       }else{
                         mostrarAlerta(context, 'Error', r);
                       }
                      }
                    },
                  ),
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
      ),
    );
  }
}

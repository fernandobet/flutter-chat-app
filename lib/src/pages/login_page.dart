import 'package:after_layout/after_layout.dart';
import 'package:chat_app/src/helpers/mostrar_alerta.dart';
import 'package:chat_app/src/pages/register_page.dart';
import 'package:chat_app/src/services/auth_service.dart';
import 'package:chat_app/src/widgets/custom_button.dart';
import 'package:chat_app/src/widgets/custom_footer.dart';
import 'package:chat_app/src/widgets/custom_input.dart';
import 'package:chat_app/src/widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'labels_page.dart';

class LoginPage extends StatefulWidget {
  static final ruta = 'login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AfterLayoutMixin<LoginPage>
{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthService _provider;

    @override
  void afterFirstLayout(BuildContext context) {
    _provider = Provider.of<AuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {

    print('Inicinando');
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
                  HeaderWidget(
                    titulo: 'Bienvenido',
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
                    icon: Icons.account_circle,
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
                      contenido: 'Log in', 
                      onPressed:()async{
                        FocusScope.of(context).unfocus();
                        if(_formKey.currentState.validate()){
                          final res = await _provider.login(_emailController.text, _passController.text);
                          if(res==true){
                            //TODO: OK
                            Navigator.of(context).pushReplacementNamed('usuarios');
                          }else{
                            //TODO: Alerta
                            mostrarAlerta(context, 'Error', res);
                          }
                        }
                      }
                      ),
                  LabelsPage(
                    pregunta: '¿No tienes una cuenta?',
                    estado: 'Crea una cuenta',
                    navegar: RegisterPage.ruta,
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

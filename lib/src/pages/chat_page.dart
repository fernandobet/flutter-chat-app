import 'package:chat_app/src/pages/mensaje_page.dart';
import 'package:chat_app/src/providers/chat_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  static final String ruta = 'chatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final FocusNode _foco = FocusNode();
  final TextEditingController _mensajeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ListaMensajesProvider>(context, listen: false).iniciarLista();
    Provider.of<ChatPageProvider>(context, listen: false).iniciarEstado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.0,
          child: Column(
            children: <Widget>[
              _buildHeader(),
              _buildListaMensajes(),
              _buildFooter(context)
            ],
          ),
        ),
      ),
    );
  }

  _buildFooter(BuildContext context) {
    return SafeArea(
      child: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[300]),
                  child: TextField(
                    controller: _mensajeController,
                    onSubmitted: (texto) => _enviarMensaje(texto, context),
                    onChanged: (texto) {
                      if (texto.length > 0) {
                        Provider.of<ChatPageProvider>(context, listen: false)
                            .cambiarEstado();
                      } else {
                        Provider.of<ChatPageProvider>(context, listen: false)
                            .iniciarEstado();
                      }
                    },
                    decoration: InputDecoration.collapsed(hintText: 'Mensaje'),
                    focusNode: _foco,
                  ),
                ),
              ),
              Consumer<ChatPageProvider>(
                builder: (context, provider, child) {
                  if (provider.escribiendo) {
                    return _botonEnviarMensaje(context);
                  } else {
                    return _botonesSecundarios();
                  }
                },
              )
            ],
          )),
    );
  }

  void _enviarMensaje(String mensaje, BuildContext context) {
    //En la parte vsync:this. El this lo sacamos del mix que importamos
    final _mensaje = new MensajePage(
      uid: '123',
      mensaje: mensaje,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 500)),
    );
    Provider.of<ListaMensajesProvider>(context, listen: false)
        .agregarMensaje(_mensaje);
    //Con esto disparamos la animcion
    _mensaje.animationController.forward();
    _mensajeController.clear();
    Provider.of<ChatPageProvider>(context, listen: false).iniciarEstado();
    _foco.requestFocus();
  }

  Widget _botonesSecundarios() {
    final _list = List<Widget>();
    final _boton1 = Container(
      margin: EdgeInsets.only(left: 5),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.photo_camera, size: 20, color: Colors.white),
          onPressed: () {}),
    );
    final _boton2 = Container(
      margin: EdgeInsets.only(left: 5),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.audiotrack, size: 20, color: Colors.white),
          onPressed: () {}),
    );
    _list.add(_boton1);
    _list.add(_boton2);
    return Row(
      children: _list,
    );
  }

  Widget _botonEnviarMensaje(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(Icons.arrow_right, size: 25, color: Colors.white),
          onPressed: () {
            final _valorMensaje = _mensajeController.text;
            if (_valorMensaje != null && _valorMensaje != '') {
              _enviarMensaje(_valorMensaje, context);
            }
          }),
    );
  }

  _buildListaMensajes() {
    return Flexible(child: Consumer<ListaMensajesProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: provider.listaMensajes?.length,
            reverse: true,
            itemBuilder: (_, i) {
              if (provider.listaMensajes.length > 0) {
                return Container(child: provider.listaMensajes[i]);
              }
            });
      },
    ));
  }

  _buildHeader() {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Container(
              child: CupertinoButton(
                  child: Icon(Icons.arrow_back), onPressed: () {})),
          Container(
              height: 30,
              width: 30,
              child: CircleAvatar(
                child: Text('FB'),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Fernando betancourt')),
          Expanded(child: Container()),
          Container(
              child:
                  CupertinoButton(child: Icon(Icons.call), onPressed: () {})),
          Container(
              child: CupertinoButton(
                  child: Icon(Icons.video_call), onPressed: () {}))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Provider.of<ListaMensajesProvider>(context, listen: false).limpiarMensajes();
    super.dispose();
  }
}

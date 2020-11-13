import 'dart:io' as p;

class Enviroment{

static String apiURL = p.Platform.isAndroid ? 'http://192.168.1.2:3001/api' : 'http://localhost:3001/api';
static String socketURL = p.Platform.isAndroid ? 'http://10.0.2.2:3001' : 'http://localhost:3001';
}
import 'package:flutter/material.dart';
import 'package:ihealthapp_clientes/screens/transferencia/lista.dart';

void main() => runApp( XerosoApp() );

  class XerosoApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
             // theme: ThemeData.dark(),
              theme: ThemeData(
                primaryColor: Colors.green[900],
                accentColor: Colors.blue[700],
                buttonTheme: ButtonThemeData(
                  buttonColor: Colors.blueAccent[700],
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              home: ListaTransferencias(),
            );
    }
  } 
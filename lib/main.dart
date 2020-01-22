import 'package:flutter/material.dart';

void main() => runApp( XerosoApp() );

  class XerosoApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
              home: Scaffold(
                  body: FormularioTranferencias(),
              ),
            );
    }
  } 

  class FormularioTranferencias extends StatelessWidget {

    final TextEditingController _controladorCampoNumeroConta = TextEditingController();
    final TextEditingController _controladorCampoValor = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title : Text('Salvando tranferencias.', )),
          body: Column(children: <Widget>[

                  Padding(padding: const EdgeInsets.all(16.0),
                        child: TextField(
                                  controller: _controladorCampoNumeroConta, 
                                  style: TextStyle(
                                    fontSize: 16.00
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Numero da conta',
                                    hintText: '0000',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                  ),

                  Padding(padding: const EdgeInsets.all(16.0),
                        child: TextField(
                                  controller: _controladorCampoValor, 
                                  style: TextStyle(
                                    fontSize: 16.00
                                  ),
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.monetization_on),
                                    labelText: 'Valor',
                                    hintText: '0000',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                  ),
                  RaisedButton(
                    child: Text('Confirmar'), 
                    onPressed: () {

                      final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
                      final double valor    = double.tryParse(_controladorCampoValor.text);

                      if ( numeroConta != null &&  valor != null) {
                        final transferenciaCriada = Transferencia(valor, numeroConta);
                        debugPrint('$transferenciaCriada');
                      }
                    
                    },
                    
                  )
          ],),
        );
    }
  }

  class ListaTransferencias extends StatelessWidget {
      
    @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar( title: Text('Teste 123'), ),
            body: Column(
                children: <Widget>[
                    ItemTransferencia( Transferencia(101.00, 1000) ),
                    ItemTransferencia( Transferencia(102.00, 1234) ),
                    ItemTransferencia( Transferencia(103.00, 1122) ),
                ],
              ),
            floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
         ),
      );
    }

  }

  class ItemTransferencia extends StatelessWidget {

    final Transferencia _transferencia;

    ItemTransferencia(this._transferencia);

    @override
    Widget build(BuildContext context) {
      return Card(
               child: ListTile(
                 leading: Icon(Icons.monetization_on),
                 title: Text(_transferencia.valor.toString()),
                 subtitle: Text(_transferencia.numeroConta.toString() ),
               ),
             );
    }

  }

  class Transferencia {

    final double valor;
    final int numeroConta;

    Transferencia(this.valor, this.numeroConta);

    @override
    String toString() {
      return 'Transferencia: valor: $valor. numeroConta: $numeroConta';
    }
  }
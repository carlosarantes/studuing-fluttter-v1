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
                  Editor( controlador:   _controladorCampoNumeroConta, rotulo : 'Numero da Conta', dica : '0000'),
                  Editor( controlador :_controladorCampoValor, rotulo : 'Valor', dica : '0000', icone : Icons.monetization_on),
                  RaisedButton(
                    child: Text('Confirmar'), 
                    onPressed: () => _criaTransferencia(),
                  )
          ],),
        );
    }

    void _criaTransferencia() {
      final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
      final double valor    = double.tryParse(_controladorCampoValor.text);

      if ( numeroConta != null &&  valor != null) {
        final transferenciaCriada = Transferencia(valor, numeroConta);
        debugPrint('$transferenciaCriada');
      }
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



  class Editor extends StatelessWidget {

    final TextEditingController controlador;
    final String rotulo;
    final String dica;
    final IconData icone;

    Editor({this.controlador, this.rotulo, this.dica, this.icone});

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Padding(padding: const EdgeInsets.all(16.0),
                        child: TextField(
                                  controller: controlador, 
                                  style: TextStyle(
                                    fontSize: 16.00
                                  ),
                                  decoration: InputDecoration(
                                    icon:  icone != null ? Icon(icone) : null,
                                    labelText: rotulo,
                                    hintText: dica,
                                  ),
                                  keyboardType: TextInputType.number,
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
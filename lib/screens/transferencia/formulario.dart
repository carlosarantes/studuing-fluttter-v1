import 'package:flutter/material.dart';
import 'package:ihealthapp_clientes/components/editor.dart';
import 'package:ihealthapp_clientes/models/transferencia.dart';

const _tituloAppBar = 'Salvando tranferencias';

const _rotuloCampoValor  = 'Valor';
const _dicaCampoValor    = '0.00';
const _rotuloCampoNumeroConta = 'Numero da Conta';
const _dicaCampoNumeroConta   = '0000';
const _textoBotaoConfirmar    = 'Confirmar';


class FormularioTranferencias extends StatefulWidget {

    @override
    State<StatefulWidget> createState() {
      return FormularioTranferenciasState();
    }
  }


class FormularioTranferenciasState extends State<FormularioTranferencias> {

    final TextEditingController _controladorCampoNumeroConta = TextEditingController();
    final TextEditingController _controladorCampoValor = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title : Text(_tituloAppBar)),
          body: SingleChildScrollView(
            child: 
                Column(
                  children: <Widget>[
                        Editor( 
                          controlador: _controladorCampoNumeroConta, 
                          rotulo : _rotuloCampoNumeroConta, 
                          dica : _dicaCampoNumeroConta,
                        ),
                        Editor( 
                          controlador :_controladorCampoValor, 
                          rotulo : _rotuloCampoValor, 
                          dica : _dicaCampoValor, 
                          icone : Icons.monetization_on, 
                        ),
                        RaisedButton(
                          child: Text(_textoBotaoConfirmar), 
                          onPressed: () => _criaTransferencia(context),
                        ),
                ],),
          ),
        );
    }

    void _criaTransferencia(BuildContext context) {
      final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
      final double valor    = double.tryParse(_controladorCampoValor.text);

      if ( numeroConta != null &&  valor != null) {
        final transferenciaCriada = Transferencia(valor, numeroConta);
        Navigator.pop(context, transferenciaCriada);
      }
    }

  }
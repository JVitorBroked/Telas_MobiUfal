import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobi_ufal/Session.dart';
import 'package:mobi_ufal/User.dart';

import 'main.dart';
import 'TelaCadastroFinalizado.dart';

class TelaCadastroPCD extends StatefulWidget {
  final String name;
  final String socialName;
  final String email;
  final String cpf;
  final String phone;

  const TelaCadastroPCD(
      {Key? key,
      required this.name,
      required this.socialName,
      required this.email,
      required this.cpf,
      required this.phone})
      : super(key: key);

  _TelaCadastroPCDState createState() => _TelaCadastroPCDState();
}

class _TelaCadastroPCDState extends State<TelaCadastroPCD> {
//Mudar tipo de lista e adicionar itens
  var vinculos = ['Estudante', 'Servidor', 'Profissional terceirizado'];

  var tipoDeficiencias = [
    'Baixa visão',
    'Cegueira',
    'surdocegueira',
    'Física',
    'Múltipla'
  ];

  var cursos = ['Ciência da Computação', 'Engenharia de Computação'];

  String? deficienciaSelecionada;
  String? cursoSelecionado;
  String? vinculoSelecionado;

  final TextEditingController _controladorSenha = TextEditingController();
  final TextEditingController _controladorConfirmarSenha =
      TextEditingController();

  final _dropdownFormKey = GlobalKey<FormState>();
  final _dropdownFormKey2 = GlobalKey<FormState>();
  final _dropdownFormKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.blue,
        appBar: AppBar(
            toolbarHeight: 90,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/Mobi_logo.png',
                fit: BoxFit.contain,
                height: 84,
                width: 50,
              ),
              const Spacer(),
              Text(MyApp.title,
                  textScaleFactor: 2.3,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(flex: 4),
            ])),
        body: Center(
            child: Container(
                //width: 300,
                child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 168, 0),
                child: Text(
                  'Criar perfil',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                )),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
              child: Form(
                key: _dropdownFormKey,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) =>
                      value == null ? "Selecione vínculo" : null,
                  dropdownColor: Colors.white,
                  value: vinculoSelecionado,
                  onChanged: (String? newValue) {
                    setState(() {
                      vinculoSelecionado = newValue!;
                    });
                  },
                  hint: Text("Vínculo com a UFAL*"),
                  items: vinculos.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
                child: Form(
                  key: _dropdownFormKey2,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) =>
                        value == null ? "Selecione deficiência" : null,
                    dropdownColor: Colors.white,
                    value: deficienciaSelecionada,
                    onChanged: (String? newValue) {
                      setState(() {
                        deficienciaSelecionada = newValue!;
                      });
                    },
                    hint: Text("Tipo de Deficiência*"),
                    items: tipoDeficiencias.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
                child: Form(
                  key: _dropdownFormKey3,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) =>
                        value == null ? "Selecione curso" : null,
                    dropdownColor: Colors.white,
                    value: cursoSelecionado,
                    onChanged: (String? newValue) {
                      setState(() {
                        cursoSelecionado = newValue!;
                      });
                    },
                    hint: Text("Curso*"),
                    items: cursos.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                  ),
                )),
            inputData("Senha*", true, _controladorSenha),
            inputData("Confirmar senha*", true, _controladorConfirmarSenha),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 5,
                  minimumSize: Size(258, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  )),
              onPressed: () {
                if (_dropdownFormKey.currentState!.validate() &&
                    _dropdownFormKey2.currentState!.validate() &&
                    _dropdownFormKey3.currentState!.validate() &&
                    _controladorSenha.text.isNotEmpty &&
                    _controladorSenha.text
                            .compareTo(_controladorConfirmarSenha.text) ==
                        0) {
                  //valid flow

                  Future<http.Response> response = teste(User(
                      name: widget.name,
                      email: widget.email,
                      phone: widget.phone,
                      affiliation: vinculoSelecionado.toString(),
                      course_sector: cursoSelecionado.toString(),
                      role: deficienciaSelecionada.toString(),
                      password: _controladorSenha.text));

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Session(data: response)));

                  /*Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const TelaCadastroFinalizado()));
                */
                } else {
                  showAlertDialog(context);
                }
              },
              child: const Text(
                'Finalizar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Spacer(flex: 4),
          ],
        ))));
  }
}

Widget inputData(String label, bool obsText, TextEditingController controller) {
  return Padding(
      padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
      child: TextField(
        controller: controller,
        obscureText: obsText,
        decoration: InputDecoration(
          // border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          labelText: label,
        ),
      ));
}

Future<http.Response> enviarSolicitacaoCadastro(User user) async {
  final response = await http.post(Uri.parse("uri/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user));

  return response;
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
      onPressed: () => Navigator.pop(context), child: const Text("OK"));

  AlertDialog alertDialog =
      AlertDialog(title: const Text("Preencha os campos"), actions: [okButton]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

Future<http.Response> teste(User user) async {
  final response =
      await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user));

  return response;
}

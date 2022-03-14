import 'package:flutter/material.dart';
import 'package:mobi_ufal/TelaCadastroFinalizado.dart';

import 'main.dart';

class TelaCadastroVoluntario extends StatefulWidget {
  const TelaCadastroVoluntario({Key? key}) : super(key: key);

  _TelaCadastroVoluntarioState createState() => _TelaCadastroVoluntarioState();
}

class _TelaCadastroVoluntarioState extends State<TelaCadastroVoluntario> {
//Mudar tipo de lista e adicionar itens
  var vinculos = ['Discente', 'Docente'];
  var cursos = ['Ciência da Computação', 'Engenharia de Computação'];

  String? cursoSelecionado;
  String? vinculoSelecionado;

  final _dropdownFormKey = GlobalKey<FormState>();
  final _dropdownFormKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.blue,
        appBar: AppBar(
            toolbarHeight: 150,
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
                      value == null ? "Selecione curso" : null,
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
            inputData("Senha*", true),
            inputData("Confirmar senha*", true),
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
                    _dropdownFormKey2.currentState!.validate()) {
                  //valid flow
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              TelaCadastroFinalizado()));
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

Widget inputData(String label, bool obsText) {
  return Padding(
      padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
      child: TextField(
        obscureText: obsText,
        decoration: InputDecoration(
          // border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          labelText: label,
        ),
      ));
}

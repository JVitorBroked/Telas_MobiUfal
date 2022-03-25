import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobi_ufal/Session.dart';

import 'main.dart';
import 'TelaCadastro.dart';

bool statusError = false;

class TelaLogin extends StatelessWidget {
  TelaLogin({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget inputs(
        String label, bool obsText, TextEditingController controller) {
      return TextField(
        controller: controller,
        obscureText: obsText,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
          labelText: label,
        ),
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.blue,
        appBar: AppBar(
            toolbarHeight: 150,
            //leading: const IconButton(
            //  icon: Icon(Icons.arrow_back, color: Colors.white),
            //  onPressed: null,
            //),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            //flexibleSpace: Container(
            //    decoration: const BoxDecoration(
            //        image: DecorationImage(
            //  image: AssetImage('assets/MobiUfal_logo.png'),
            //))),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
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
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 4,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              inputs("Email", false, _controllerEmail),
              Spacer(),
              inputs("Senha", true, _controllerPassword),
              Spacer(),
              const Text(
                "Esqueceu a senha?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline),
              ),
              Spacer(flex: 4),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 5,
                      minimumSize: Size(258, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      )),
                  onPressed: () {
                    //validar e ir para tela de sessao

                    /*Future<String> resp = teste();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Session(
                                  data: resp,
                                )));
                    */
                    if (_controllerEmail.text.isNotEmpty &&
                        _controllerPassword.text.isNotEmpty) {
                      Future<http.Response> response = teste(
                          _controllerEmail.text, _controllerPassword.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Session(
                                    data: response,
                                  )));
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      minimumSize: Size(258, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TelaCadastro()));
                  },
                  child: const Text(
                    'Não Possui conta? Cadastre-se',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Spacer(flex: 4),
            ],
          ),
        )));
  }
}

Future<http.Response> tryLogin(String email, String password) async {
  final response = await http.post(Uri.parse("uri/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"email": email, "password": password}));
  return response;
}

Future<http.Response> teste(String a, String b) async {
  final responde =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));
  return responde;
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

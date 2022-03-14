import 'package:flutter/material.dart';

import 'main.dart';
import 'TelaCadastro.dart';

class TelaLogin extends StatelessWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputs(String label, bool obsText) {
      return TextField(
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
              inputs("Email", false),
              Spacer(),
              inputs("Senha", true),
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
                  onPressed: null,
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

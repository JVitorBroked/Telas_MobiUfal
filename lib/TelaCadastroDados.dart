import 'package:flutter/material.dart';

import 'TelaCadastroPcD.dart';
import 'TelaCadastroVoluntario.dart';
import 'main.dart';

class TelaCadastroDados extends StatelessWidget {
  final String typeUser;
  const TelaCadastroDados({Key? key, required this.typeUser}) : super(key: key);

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
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 168, 0),
                child: Text(
                  'Criar perfil',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500),
                )),
            //Spacer(),
            inputData("Nome*", false),
            inputData("Nome Social", false),
            inputData("Email*", false),
            inputData("CPF**", false),
            inputData("Telefone*", false),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 27, 51, 0),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 5,
                      minimumSize: Size(128, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      )),
                  onPressed: () {
                    if (typeUser == "User") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TelaCadastroPCD()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TelaCadastroVoluntario()));
                    }
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),

            //Spacer(flex: 5),
          ],
        ))));
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
}

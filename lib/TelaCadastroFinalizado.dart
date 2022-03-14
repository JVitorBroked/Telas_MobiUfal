import 'package:flutter/material.dart';
import 'package:mobi_ufal/TelaCadastro.dart';
import 'package:mobi_ufal/Telainicial.dart';

import 'main.dart';

class TelaCadastroFinalizado extends StatelessWidget {
  const TelaCadastroFinalizado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Spacer(flex: 2),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Spacer(flex: 3),
          Image.asset(
            'assets/Mobi_logo.png',
            fit: BoxFit.contain,
            height: 84,
            width: 56,
          ),
          Spacer(),
          Text(MyApp.title,
              //textScaleFactor: 3,
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Spacer(flex: 4),
        ]),
        const Text('Seu cadastro',
            //textScaleFactor: 2,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const Text('foi',
            //textScaleFactor: 2,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const Text('finalizado!',
            //textScaleFactor: 2,
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        Spacer(),
        const Icon(Icons.done_outlined, color: Colors.white, size: 116),
        Spacer(),
        const Padding(
          padding: EdgeInsets.fromLTRB(69, 0, 69, 0),
          child: Text(
            'Estamos analisando seus dados e em breve você poderá acessar a sua conta!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Spacer(),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 5,
              minimumSize: Size(258, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              )),
          onPressed: () {
            Navigator.popUntil(context, (route) => true);
          },
          child: const Text(
            'Voltar ao início',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ),
        Spacer(),
      ]),
    ));
  }
}

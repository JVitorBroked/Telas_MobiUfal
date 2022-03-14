import 'package:flutter/material.dart';

import 'TelaLogin.dart';
import 'main.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Image.asset(
          'assets/Mobi_logo.png',
          fit: BoxFit.contain,
          height: 84,
          width: 56,
        ),
        Spacer(),
        Text(MyApp.title,
            textScaleFactor: 3,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
        const Spacer(flex: 2),
        const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(69, 0, 0, 0),
              child: Text(
                'Olá!',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w200),
              ),
            )),
        Spacer(),
        const Text(
          'Seja bem vindo ao\nMobiUfal',
          style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
              fontFamily: 'Lato'),
        ),
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => TelaLogin()));
          },
          child: const Text(
            'Iniciar',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ),
        Spacer(flex: 3),
      ],
    )));
  }
}

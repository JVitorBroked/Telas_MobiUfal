//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Telainicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final String title = 'MobiUfal';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        //primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Color(0xFF29AAD7),
      ),
      home:
          const TelaInicial(), //alterar aq para adicionar tela com appbar proprio
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Colors.blue,
      appBar: AppBar(
          toolbarHeight: 90,
          leading: const IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: null,
          ),
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
      body:
          TelaInicial(), //moficar aq para testar outras telas com appbar predefinido
    );
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

import 'package:flutter/material.dart';

import 'main.dart';
import 'TelaCadastroDados.dart';

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 3),
            const Text(
              'Cadastro',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Você é...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
            const Spacer(flex: 2),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                  minimumSize: Size(298, 102),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  )),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TelaCadastroDados(typeUser: "User")));
              },
              child: const Text(
                'Usuário',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            const Spacer(flex: 2),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 5,
                  minimumSize: Size(298, 102),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  )),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TelaCadastroDados(typeUser: "Volunteer")));
              },
              child: const Text(
                'Voluntário',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Spacer(flex: 5),
          ],
        )));
  }
}

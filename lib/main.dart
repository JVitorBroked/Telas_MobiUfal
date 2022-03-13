import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          TelaInicial(), //alterar aq para adicionar tela com appbar personalizado
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          //flexibleSpace: Container(
          //    decoration: const BoxDecoration(
          //        image: DecorationImage(
          //  image: AssetImage('assets/MobiUfal_logo.png'),
          //))),
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
          TelaLogin(), //moficar aq para testar outras telas com appbar predefinido
    );
  }
}

class TelaCadastro extends StatelessWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(flex: 3),
        const Text(
          'Cadastro',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Você é...',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300),
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
          onPressed: null,
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
          onPressed: null,
          child: const Text(
            'Voluntário',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        Spacer(flex: 5),
      ],
    ));
  }
}

class TelaLogin extends StatelessWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const inputEmail = TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Email',
      ),
    );

    const inputSenha = TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
        labelText: 'Senha',
      ),
    );

    return Center(
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
                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          inputEmail,
          Spacer(),
          inputSenha,
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
              onPressed: null,
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
    ));
  }
}

class TelaInicial extends StatelessWidget {
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
          onPressed: null,
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

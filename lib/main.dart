//import 'dart:html';

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
          HomePage(), //alterar aq para adicionar tela com appbar personalizado
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
          TelaCadastroVoluntario(), //moficar aq para testar outras telas com appbar predefinido
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
          onPressed: null,
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

class TelaCadastroDados extends StatelessWidget {
  const TelaCadastroDados({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Center(
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
              onPressed: null,
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
    )));
  }
}

class TelaCadastroPCD extends StatefulWidget {
  const TelaCadastroPCD({Key? key}) : super(key: key);

  _TelaCadastroPCDState createState() => _TelaCadastroPCDState();
}

class _TelaCadastroPCDState extends State<TelaCadastroPCD> {
//Mudar tipo de lista e adicionar itens
  var vinculos = ['Discente', 'Docente'];

  var tipoDeficiencias = ['Motora', 'Visual'];

  var cursos = ['Ciência da Computação', 'Engenharia de Computação'];

  /* Widget downButton(String label, List<String> lista, String selecionado) {
    return DropdownButton(
        hint: Text(label, style: TextStyle(color: Colors.black)),
        value: selecionado,
        items: lista.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        iconSize: 25,
        onChanged: (String? newValue) {
          setState(() {
            selecionado = newValue!;
          });
        });
  }
  */

  String? deficienciaSelecionada;
  String? cursoSelecionado;
  String? vinculoSelecionado;

  final _dropdownFormKey = GlobalKey<FormState>();
  final _dropdownFormKey2 = GlobalKey<FormState>();
  final _dropdownFormKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                //enabledBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: Colors.black, width: 1),
                //  borderRadius: BorderRadius.circular(5),
                //),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value == null ? "Selecione vínculo" : null,
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

            //ElevatedButton(
            //    onPressed: () {
            //      if (_dropdownFormKey.currentState!.validate()) {
            //        //valid flow
            //      }
            //    },
            //    child: Text("Submit")),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
            child: Form(
              key: _dropdownFormKey2,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  //enabledBorder: OutlineInputBorder(
                  //borderSide: BorderSide(color: Colors.black, width: 1),
                  //  borderRadius: BorderRadius.circular(5),
                  //),
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
                  //enabledBorder: OutlineInputBorder(
                  //borderSide: BorderSide(color: Colors.black, width: 1),
                  //  borderRadius: BorderRadius.circular(5),
                  //),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) => value == null ? "Selecione curso" : null,
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
                _dropdownFormKey2.currentState!.validate() &&
                _dropdownFormKey3.currentState!.validate()) {
              //valid flow
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
    )));
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
    return Center(
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
                //enabledBorder: OutlineInputBorder(
                //borderSide: BorderSide(color: Colors.black, width: 1),
                //  borderRadius: BorderRadius.circular(5),
                //),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value == null ? "Selecione curso" : null,
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

            //ElevatedButton(
            //    onPressed: () {
            //      if (_dropdownFormKey.currentState!.validate()) {
            //        //valid flow
            //      }
            //    },
            //    child: Text("Submit")),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(51, 13, 51, 0),
            child: Form(
              key: _dropdownFormKey2,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  //enabledBorder: OutlineInputBorder(
                  //borderSide: BorderSide(color: Colors.black, width: 1),
                  //  borderRadius: BorderRadius.circular(5),
                  //),
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
    )));
  }
}

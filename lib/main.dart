import 'package:flutter/material.dart';

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
      home: HomePage(),
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
      body: TelaCadastro(),
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

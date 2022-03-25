import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Session extends StatelessWidget {
  Future<http.Response> data;
  Session({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: FutureBuilder<http.Response>(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text((snapshot.data?.body).toString());
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

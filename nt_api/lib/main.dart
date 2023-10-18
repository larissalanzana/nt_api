// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nt_api/screens/telaArquivos.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NtAPI(),
  ));
}

class NtAPI extends StatelessWidget {
  const NtAPI({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New York Times API"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Arquivos();
                  },
                ));
              },
              child: Column(
                children: [
                  Image.asset(
                    "images/archives.png",
                    height: 120,
                    width: 120,
                  ),
                  const Text(
                    "Arquivos",
                    style: TextStyle(
                        fontFamily: AutofillHints.countryCode, fontSize: 25),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

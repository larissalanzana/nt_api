import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nt_api/models/arquivos.dart';

class Arquivos extends StatefulWidget {
  @override
  State<Arquivos> createState() => _ArquivosState();
}

class _ArquivosState extends State<Arquivos> {
  List<Arquivo> listaArquivos = [];

  Future<List> pageData() async {
    final response = await http.Client().get(Uri.parse(
        "https://api.nytimes.com/svc/archive/v1/2019/1.json?api-key=XaKShnZUbtnAekUQs7m8Emhcm46Mzg5I"));
    if (response.statusCode == 200) {
      var dadosArquivos = json.decode(response.body);
      List arquivos = dadosArquivos["response"]["docs"];
      arquivos.forEach((arquivo) {
        Arquivo a = Arquivo(
            abstract: arquivo['abstract'],
            web_url: arquivo['web_url'],
            snippet: arquivo['snippet'],
            lead_paragraph: arquivo['lead_paragraph'],
            source: arquivo['source']);
        listaArquivos.add(a);
      });
    } else {
      throw Exception("Falha ao carregar os dados dos arquivos");
    }
    return listaArquivos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arquivos"),
      ),
      body: FutureBuilder(
        initialData: [],
        future: pageData(),
        builder: (context, snapshot) {
          List arquivos = snapshot.data as List;
          return ListView.builder(
            itemCount: arquivos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Abstract: ${arquivos[index].abstract}"),
              );
            },
          );
        },
      ),
    );
  }
}

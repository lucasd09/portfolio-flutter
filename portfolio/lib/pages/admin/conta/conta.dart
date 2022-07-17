// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Conta extends StatelessWidget {
  const Conta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: ContaBody(),
    );
  }
}

class ContaBody extends StatelessWidget {
  ContaBody({Key? key}) : super(key: key);

  final db = FirebaseFirestore.instance;

  var idade = DateTime.now().year - 2002;

  final careerController = TextEditingController();
  final companyController = TextEditingController();

  final Stream<QuerySnapshot> about =
      FirebaseFirestore.instance.collection("info").snapshots();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: StreamBuilder(
              stream: about,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('ERRO');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.requireData;

                return Text(
                    'Meu nome é ${data.docs[0]['name']}, tenho $idade anos e sou ${data.docs[0]['career']}, atualmente trabalhando na empresa ${data.docs[0]['company']}.');
              }),
        ),
        TextFormField(
          obscureText: false,
          controller: careerController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Cargo',
          ),
        ),
        TextFormField(
          obscureText: false,
          controller: companyController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Empresa',
          ),
        ),
        ElevatedButton(
            onPressed: () {
              var info = <String, dynamic>{
                "career": careerController.text.trim(),
                "company": companyController.text.trim()
              };

              if (careerController.text != '' && companyController.text != '') {
                db.collection('info').doc('1').update(info);

                final snackBar = SnackBar(
                  content: const Text('Alteração realizada com Sucesso!'),
                  action: SnackBarAction(
                    label: 'Fechar',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                careerController.clear();
                companyController.clear();
              }
            },
            child: const Text('Alterar'))
      ]),
    );
  }
}

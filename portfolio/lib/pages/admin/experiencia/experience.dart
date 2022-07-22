import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../constants/app_constants.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: ExperienceBody(),
    );
  }
}

class ExperienceBody extends StatefulWidget {
  ExperienceBody({Key? key}) : super(key: key);

  @override
  State<ExperienceBody> createState() => _ExperienceBodyState();
}

class _ExperienceBodyState extends State<ExperienceBody> {
  final nameController = TextEditingController();

  final jobController = TextEditingController();

  final descController = TextEditingController();

  final dataini = TextEditingController();

  final datafin = TextEditingController();

  var isAtual = false;

  final db = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> experiences =
      FirebaseFirestore.instance.collection("experience").snapshots();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome da Empresa',
          ),
        ),
        TextFormField(
          controller: jobController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Cargo',
          ),
        ),
        TextFormField(
          controller: descController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Descrição',
          ),
        ),
        TextFormField(
          controller: dataini,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Data de Início',
          ),
          readOnly: true,
          onTap: () async {
            timePicker(context, dataini);
          },
        ),
        CheckboxListTile(
            title: const Text('É meu emprego atual'),
            value: isAtual,
            onChanged: (newValue) {
              setState(() {
                isAtual = newValue!;
              });
            }),
        TextFormField(
          controller: datafin,
          enabled: !isAtual,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Data de Término',
          ),
          readOnly: true,
          onTap: () async {
            timePicker(context, datafin);
          },
        ),
        StreamBuilder<QuerySnapshot>(
            stream: experiences,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('ERRO');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              final data = snapshot.requireData;
              return ElevatedButton(
                  onPressed: () {
                    if (nameController.text != '' &&
                        descController.text != '') {
                      var input = <String, dynamic>{
                        "name": nameController.text.trim(),
                        "desc": descController.text.trim(),
                        "atual": isAtual,
                        "job": jobController.text.trim(),
                        "startdate":
                            Timestamp.fromDate(DateTime.parse(dataini.text)),
                        "enddate": datafin.text != ""
                            ? Timestamp.fromDate(DateTime.parse(datafin.text))
                            : Timestamp.fromDate(DateTime.now())
                      };

                      db
                          .collection("experience")
                          .doc((data.size + 1).toString())
                          .set(input);

                      nameController.clear();
                      descController.clear();
                      jobController.clear();
                      isAtual = false;
                      dataini.clear();
                      datafin.clear();

                      final snackBar = SnackBar(
                        content: const Text(
                            'Cadastro de experiência realizado com Sucesso!'),
                        action: SnackBarAction(
                          label: 'Fechar',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text('Adicionar'));
            })
      ]),
    );
  }
}

timePicker(context, dateInput) async {
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100));

  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    dateInput.text = formattedDate;
  } else {}
}

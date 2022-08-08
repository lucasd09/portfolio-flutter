import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../constants/app_constants.dart';

class Cursos extends StatelessWidget {
  const Cursos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: CursosBody(),
    );
  }
}

class CursosBody extends StatefulWidget {
  CursosBody({Key? key}) : super(key: key);

  @override
  State<CursosBody> createState() => _CursosBodyState();
}

class _CursosBodyState extends State<CursosBody> {
  final nameController = TextEditingController();

  final jobController = TextEditingController();

  final placeController = TextEditingController();

  final dataini = TextEditingController();

  final datafin = TextEditingController();

  var isAtual = false;

  final db = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> courses =
      FirebaseFirestore.instance.collection("courses").snapshots();

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
          controller: placeController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Instituição',
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
        TextFormField(
          controller: datafin,
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
            stream: courses,
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
                        placeController.text != '') {
                      var input = <String, dynamic>{
                        "name": nameController.text.trim(),
                        "place": placeController.text.trim(),
                        "startdate":
                            Timestamp.fromDate(DateTime.parse(dataini.text)),
                        "enddate": datafin.text != ""
                            ? Timestamp.fromDate(DateTime.parse(datafin.text))
                            : Timestamp.fromDate(DateTime.now())
                      };

                      db
                          .collection("courses")
                          .doc((data.size + 1).toString())
                          .set(input);

                      nameController.clear();
                      placeController.clear();
                      jobController.clear();
                      isAtual = false;
                      dataini.clear();
                      datafin.clear();

                      final snackBar = SnackBar(
                        content: const Text(
                            'Cadastro de Curso realizado com Sucesso!'),
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

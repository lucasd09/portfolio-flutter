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

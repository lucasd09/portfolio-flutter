import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../constants/app_constants.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: BackgroundColor, toolbarHeight: 80),
      body: ExperienciaBody(),
    );
  }
}

class ExperienciaBody extends StatelessWidget {
  ExperienciaBody({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> experiencia = FirebaseFirestore.instance
      .collection("experience")
      .orderBy('startdate')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 15),
          child: Text(
            'Experiência',
            style: TextStyle(fontSize: 36),
          ),
        ),
        const Divider(
          thickness: 1,
        ),
        StreamBuilder(
            stream: experiencia,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('ERRO');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final data = snapshot.requireData;

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    var dataini = DateFormat.yMMMd('pt-BR')
                        .format(data.docs[index]['startdate'].toDate());
                    var datafin = DateFormat.yMMMd('pt-BR')
                        .format(data.docs[index]['enddate'].toDate());

                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: ListTile(
                              horizontalTitleGap: 0,
                              leading: const Icon(
                                Icons.work_outlined,
                              ),
                              iconColor: PrimaryColor,
                              isThreeLine: true,
                              title: Text(data.docs[index]['name']),
                              subtitle: Text(
                                data.docs[index]['job'] +
                                    '\n' +
                                    dataini +
                                    ' à ' +
                                    datafin,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: Text(data.docs[index]['desc']))
                        ],
                      ),
                    );
                  });
            })
      ]),
    );
  }
}

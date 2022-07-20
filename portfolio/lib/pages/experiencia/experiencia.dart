import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  final Stream<QuerySnapshot> experiencia =
      FirebaseFirestore.instance.collection("experience").snapshots();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(children: [
        const Text('Experiência'),
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
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.work_outlined,
                          ),
                          iconColor: PrimaryColor,
                          title: Text(data.docs[index]['name']),
                          subtitle: Text(
                            data.docs[index]['job'],
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        )
                      ],
                    );
                  });
            })
      ]),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);

  final Stream<QuerySnapshot> projects =
      FirebaseFirestore.instance.collection("projects").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        toolbarHeight: 80,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 25,
                color: PrimaryColor,
              ))
        ],
      ),
      body: SizedBox.expand(
          child: Column(
        children: [
          const Text('Projetos'),
          const Text('Esses são todos os projetos que já fiz:'),
          StreamBuilder(
              stream: projects,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('ERRO');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.requireData;

                return ListView.builder(itemBuilder: itemBuilder);
              })
        ],
      )),
    );
  }
}

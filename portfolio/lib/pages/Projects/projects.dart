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
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Projetos',
              style: TextStyle(fontSize: 36),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Esses são todos os projetos que já fiz:',
              style: TextStyle(fontSize: 16),
            ),
          ),
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

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            Image.asset('images/logo1.png', height: 150),
                            ListTile(
                              title: Text(data.docs[index]['name']),
                              subtitle: Text(
                                data.docs[0]['desc'],
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              })
        ],
      )),
    );
  }
}

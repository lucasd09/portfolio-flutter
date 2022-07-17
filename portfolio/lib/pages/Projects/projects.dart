import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);

  final FirebaseStorage storage = FirebaseStorage.instance;

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
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
              'Esses são todos os projetos que já fiz, para ver o link do projeto/repositório, clique no Card desejado:',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          StreamBuilder<QuerySnapshot>(
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

                if (data.size > 0) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                FutureBuilder(
                                  future: getURL(data.docs[index]['imgurl']),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text('ERRO');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }

                                    final urldata = snapshot.requireData;

                                    return Image.network(
                                      urldata.toString(),
                                      height: 180,
                                    );
                                  },
                                ),
                                ListTile(
                                  title: Text(data.docs[index]['name']),
                                  subtitle: Text(
                                    data.docs[index]['desc'],
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const Center(
                  child: Text('Não há nenhum projeto cadastrado :('),
                );
              })
        ],
      )),
    );
  }
}

Future<String> getURL(path) async {
  var downloadURL = await FirebaseStorage.instance.ref(path).getDownloadURL();

  return downloadURL;
}

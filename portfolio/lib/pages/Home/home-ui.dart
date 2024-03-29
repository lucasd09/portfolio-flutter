import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/pages/About/about.dart';
import 'package:portfolio/pages/Projects/projects.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final db = FirebaseFirestore.instance;
final FirebaseStorage storage = FirebaseStorage.instance;

var idade = DateTime.now().year - 2002;

class _HomeState extends State<Home> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 32),
    fixedSize: const Size(201, 58),
    side: const BorderSide(color: PrimaryColor, width: 4),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29))),
  );

  final Stream<QuerySnapshot> about =
      FirebaseFirestore.instance.collection("info").snapshots();

  final Stream<QuerySnapshot> projects =
      FirebaseFirestore.instance.collection("projects").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: BackgroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/portfolio-flutter-378c9.appspot.com/o/source%2FLogo1.png?alt=media&token=5fe9974b-5659-4080-bed3-88323e884d35',
            ),
          ),
          toolbarHeight: 80,
        ),
        body: ListView(
          children: [
            //Header Section
            Container(
              color: BackgroundColor,
              child: const SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    'Olá, eu sou o Lucas',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ),
              ),
            ),
            //About Section
            SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(28, 46, 0, 0),
                    child: Text(
                      'Sobre Mim',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: StreamBuilder(
                        stream: about,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('ERRO');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final data = snapshot.requireData;

                          return Text(
                              'Meu nome é ${data.docs[0]['name']}, tenho $idade anos e sou ${data.docs[0]['career']}, atualmente trabalhando na empresa ${data.docs[0]['company']}.');
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: OutlinedButton(
                            style: style,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const About()),
                              );
                            },
                            child: const Text(
                              'Sobre ',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: 550,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(28, 46, 0, 0),
                    child: Text(
                      'Projetos',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                    child: Text(
                        'Esse é meu projeto mais recente em que estou trabalhando:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: StreamBuilder(
                        stream: projects,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('ERRO');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          final data = snapshot.requireData;

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Projects()),
                              );
                            },
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  FutureBuilder(
                                    future: getURL(
                                        data.docs[data.size - 1]['imgurl']),
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

                                      return Image.network(urldata.toString(),
                                          height: 150);
                                    },
                                  ),
                                  ListTile(
                                    title:
                                        Text(data.docs[data.size - 1]['name']),
                                    subtitle: Text(
                                      data.docs[data.size - 1]['desc'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: OutlinedButton(
                            style: style,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Projects()),
                              );
                            },
                            child: const Text(
                              'Ver mais',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Text(''),
            SizedBox(
              child: Column(children: const [
                ListTile(
                  title: Text('@lucas.dalan'),
                ),
                ListTile(
                  title: Text('/lucasdalan'),
                ),
                ListTile(
                  title: Text('/lucasd09'),
                ),
              ]),
            ),
            Container(
              color: BackgroundColor,
              child: SizedBox(
                height: 80,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Developed by Lucas Dalan',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Future<String> getURL(path) async {
  var downloadURL = await FirebaseStorage.instance.ref(path).getDownloadURL();

  return downloadURL;
}

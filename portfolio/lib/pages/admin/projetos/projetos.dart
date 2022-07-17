import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/app_constants.dart';

class Projetos extends StatelessWidget {
  const Projetos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: const ProjetosBody(),
    );
  }
}

class ProjetosBody extends StatefulWidget {
  const ProjetosBody({Key? key}) : super(key: key);

  @override
  State<ProjetosBody> createState() => _ProjetosBodyState();
}

class _ProjetosBodyState extends State<ProjetosBody> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;

  List<Reference> refs = [];
  List<String> arquivos = [];
  bool loading = true;
  bool uploading = false;
  double total = 0;

  XFile? image;
  String ref = '';

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? tempImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = tempImage;
    });
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String tempRef =
          'images/img-${DateTime.now().day.toString()}${DateTime.now().second.toString()}.jpg';
      setState(() {
        ref = tempRef;
      });
      return storage.ref(tempRef).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  pickAndUploadImage() async {
    XFile? file = image;
    if (file != null) {
      UploadTask task = await upload(file.path);

      task.snapshotEvents.listen((TaskSnapshot snapshot) async {
        if (snapshot.state == TaskState.running) {
          setState(() {
            uploading = true;
            total = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          });
        } else if (snapshot.state == TaskState.success) {
          arquivos.add(await snapshot.ref.getDownloadURL());
          refs.add(snapshot.ref);
          setState(() => uploading = false);
        }
      });
    }
  }

  final nameController = TextEditingController();
  final descController = TextEditingController();
  final githubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> projects =
        FirebaseFirestore.instance.collection("projects").snapshots();

    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Adicionar Projeto'),
        TextFormField(
          obscureText: false,
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nome do Projeto',
          ),
        ),
        TextFormField(
          obscureText: false,
          controller: descController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Descrição do Projeto',
          ),
        ),
        TextFormField(
          obscureText: false,
          controller: githubController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Link do Github',
          ),
        ),
        SizedBox(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            image != null
                ? Image.file(
                    File(image!.path),
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/portfolio-flutter-378c9.appspot.com/o/source%2FLogo1.png?alt=media&token=5fe9974b-5659-4080-bed3-88323e884d35',
                    height: 80,
                  ),
            IconButton(
                onPressed: () {
                  getImage();
                },
                icon: const Icon(Icons.upload))
          ]),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: projects,
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
                        descController.text != '' &&
                        githubController.text != '') {
                      pickAndUploadImage();

                      var project = <String, dynamic>{
                        "name": nameController.text.trim(),
                        "desc": descController.text.trim(),
                        "github": githubController.text.trim(),
                        "imgurl": ref.toString()
                      };

                      db
                          .collection("projects")
                          .doc((data.size + 1).toString())
                          .set(project);

                      nameController.clear();
                      descController.clear();
                      githubController.clear();

                      final snackBar = SnackBar(
                        content: const Text(
                            'Cadastro de projeto realizado com Sucesso!'),
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

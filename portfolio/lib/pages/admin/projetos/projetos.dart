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
      body: ProjetosBody(),
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
      String ref = 'images/img-${DateTime.now().toString()}.jpg';
      return storage.ref(ref).putFile(file);
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
    return Center(
      child: Column(children: [
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
                    height: 160,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'images/logo1.png',
                    height: 160,
                  ),
            IconButton(
                onPressed: () {
                  getImage();
                },
                icon: const Icon(Icons.upload))
          ]),
        ),
        ElevatedButton(
            onPressed: () {
              var project = <String, dynamic>{
                "name" : nameController.text.trim(),
                "desc" : descController.text.trim(),
                "github" : githubController.text.trim(),
                "imgurl" : imgurl
              };
            },
            child: const Text('Adicionar'))
      ]),
    );
  }
}

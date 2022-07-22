import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/core/auth_service.dart';
import 'package:portfolio/pages/admin/conta/conta.dart';
import 'package:portfolio/pages/admin/cursos/cursos.dart';
import 'package:portfolio/pages/admin/experiencia/experience.dart';
import 'package:portfolio/pages/admin/hobbies/hobbies.dart';
import 'package:portfolio/pages/admin/projetos/projetos.dart';
import 'package:portfolio/pages/admin/sobre/sobre.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthService>().signOut();
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: AdminBody(),
    );
  }
}

class AdminBody extends StatelessWidget {
  AdminBody({Key? key}) : super(key: key);

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 32),
    side: const BorderSide(color: PrimaryColor, width: 4),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29))),
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Conta()),
                );
              },
              child: const Text(
                'Conta',
                style: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Projetos()),
                );
              },
              child: const Text(
                'Projetos',
                style: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Experience()),
                );
              },
              child: const Text(
                'Experiência',
                style: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Hobbies()),
                );
              },
              child: const Text(
                'Hobbies',
                style: TextStyle(color: Colors.black),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: OutlinedButton(
              style: style,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cursos()),
                );
              },
              child: const Text(
                'Cursos',
                style: TextStyle(color: Colors.black),
              )),
        ),
      ]),
    );
  }
}

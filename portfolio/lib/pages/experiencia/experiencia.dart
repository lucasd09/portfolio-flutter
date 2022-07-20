import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: ExperienciaBody(),
    );
  }
}

class ExperienciaBody extends StatelessWidget {
  const ExperienciaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

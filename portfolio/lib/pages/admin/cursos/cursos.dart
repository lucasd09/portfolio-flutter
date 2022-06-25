import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Cursos extends StatelessWidget {
  const Cursos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: CursosBody(),
    );
  }
}

class CursosBody extends StatelessWidget {
  const CursosBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

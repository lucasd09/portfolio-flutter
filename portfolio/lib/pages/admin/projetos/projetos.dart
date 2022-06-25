import 'package:flutter/material.dart';

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

class ProjetosBody extends StatelessWidget {
  const ProjetosBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

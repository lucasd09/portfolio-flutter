import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: SobreBody(),
    );
  }
}

class SobreBody extends StatelessWidget {
  const SobreBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

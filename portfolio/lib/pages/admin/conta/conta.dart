import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Conta extends StatelessWidget {
  const Conta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: ContaBody(),
    );
  }
}

class ContaBody extends StatelessWidget {
  const ContaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

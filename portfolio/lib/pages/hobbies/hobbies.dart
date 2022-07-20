import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Hobbies extends StatelessWidget {
  const Hobbies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: HobbiesBody(),
    );
  }
}

class HobbiesBody extends StatelessWidget {
  const HobbiesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

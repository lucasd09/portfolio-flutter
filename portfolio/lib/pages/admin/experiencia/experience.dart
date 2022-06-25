import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: ExperienceBody(),
    );
  }
}

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

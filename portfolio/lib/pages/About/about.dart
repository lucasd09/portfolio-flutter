import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        toolbarHeight: 80,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 25,
                color: PrimaryColor,
              ))
        ],
      ),
      body: const AboutBody(),
    );
  }
}

class AboutBody extends StatelessWidget {
  const AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: []),
    );
  }
}

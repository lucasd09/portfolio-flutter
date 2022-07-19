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
        elevation: 0,
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
      child: Column(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 230 / 2),
              height: 144,
              decoration: const BoxDecoration(
                  color: BackgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))),
            ),
            const Positioned(
              top: 144 - 190 / 2,
              child: CircleAvatar(
                radius: 190 / 2,
                backgroundColor: Colors.white,
              ),
            ),
            const Positioned(
              top: 144 - 170 / 2,
              child: CircleAvatar(
                radius: 170 / 2,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/portfolio-flutter-378c9.appspot.com/o/source%2Fimg-profile.jpeg?alt=media&token=223458b2-5cd8-467a-9f18-6d3bf60a7894'),
              ),
            )
          ],
        ),
        Text('Lucas Dalan'),
        Text('Desenvolvedor de Software')
      ]),
    );
  }
}

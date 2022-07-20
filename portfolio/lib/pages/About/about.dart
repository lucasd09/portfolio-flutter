import 'package:flutter/material.dart';
import 'package:portfolio/pages/admin/cursos/cursos.dart';
import 'package:portfolio/pages/admin/hobbies/hobbies.dart';
import 'package:portfolio/pages/experiencia/experiencia.dart';
import 'package:portfolio/pages/skills/skills.dart';

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
        const Text('Lucas Dalan', style: TextStyle(fontSize: 36)),
        const Text('Desenvolvedor de Software',
            style: TextStyle(fontSize: 20, color: Colors.grey)),
        SizedBox(
          height: MediaQuery.of(context).size.width / 1.3,
          width: MediaQuery.of(context).size.width / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Experiencia()),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 35,
                        ),
                        Positioned(
                            top: 75,
                            child: SizedBox(
                              width: 75,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: const [
                                  Text('Experiência Profissional')
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Skills()),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 35,
                        ),
                        Positioned(
                            top: 75,
                            child: SizedBox(
                              width: 75,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: const [Text('Skills')],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cursos()),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 35,
                        ),
                        Positioned(
                            top: 75,
                            child: SizedBox(
                              width: 75,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: const [Text('Cursos')],
                              ),
                            ))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Hobbies()),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 35,
                        ),
                        Positioned(
                            top: 75,
                            child: SizedBox(
                              width: 75,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: const [Text('Hobbies')],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

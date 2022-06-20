import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/core/login/widget.dart';
import 'package:portfolio/pages/Home/home-ui.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 32),
    fixedSize: const Size(261, 58),
    side: const BorderSide(color: PrimaryColor, width: 3),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29))),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Image.asset(
              'images/logo1.png',
              width: 232,
              height: 285,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 21),
            child: Text(
              'LUCAS DALAN',
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 39),
            child: Text('Software Developer',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: OutlinedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: const Text(
                  'Conhecer',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: const Text(
                'Área do Admin',
                style: TextStyle(color: PrimaryColor),
              ))
        ],
      )),
    );
  }
}

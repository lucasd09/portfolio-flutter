import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'LUCAS DALAN',
            style: TextStyle(color: Colors.white),
          ),
          const Text('Software Developer',
              style: TextStyle(color: Colors.white)),
          ElevatedButton(onPressed: () {}, child: const Text('Conhecer')),
          TextButton(onPressed: () {}, child: const Text('Área do Admin'))
        ],
      )),
    );
  }
}

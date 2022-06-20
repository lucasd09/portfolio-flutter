import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/core/auth/widget.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

//Future main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(
//    options: DefaultFirebaseOptions.currentPlatform,
//  );
//  runApp(const MyApp());
//}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Auth());
  }
}

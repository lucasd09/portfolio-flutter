import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: BackgroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('images/logo1.png'),
          ),
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
        body: ListView(
          children: [
            //Header Section
            Container(
              color: BackgroundColor,
              child: const SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    'Olá, eu sou o Lucas',
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                ),
              ),
            ),
            //About Section
            const SizedBox(
              height: 279,
              child: Center(
                child: Text(
                  'Olá, eu sou o Lucas',
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
          ],
        ));
  }
}

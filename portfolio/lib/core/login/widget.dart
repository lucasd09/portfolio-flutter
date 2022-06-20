import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: BackgroundColor,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Se vc nao sou eu, pq vc tá aqui então?',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'e-mail',
                ),
              ),
              TextFormField(
                controller: pass,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
              OutlinedButton(onPressed: () {}, child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}

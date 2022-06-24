import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/core/auth_service.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();

  final pass = TextEditingController();

  void dispose() {
    email.dispose();
    pass.dispose();
  }

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
              OutlinedButton(
                  onPressed: () {
                    context.read<AuthService>().signIn(
                        email: email.text.trim(),
                        password: pass.text.trim());
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
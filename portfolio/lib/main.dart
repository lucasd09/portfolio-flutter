import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/core/auth/widget.dart';
import 'package:portfolio/core/auth_service.dart';
import 'package:portfolio/pages/admin/admin_page_ui.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');
    return MultiProvider(
        providers: [
          Provider<AuthService>(
            create: (_) => AuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges,
            initialData: null,
          )
        ],
        child: MaterialApp(
          title: 'Ice App',
          theme: ThemeData(
              textTheme: GoogleFonts.reemKufiTextTheme(),
              primaryColor: PrimaryColor,
              primarySwatch: Colors.green),
          home: const AuthWrapper(),
        ));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const AdminPage();
    }
    return const Auth();
  }
}

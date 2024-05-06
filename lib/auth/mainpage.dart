import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gibibooks/auth/auth_screen.dart';
import 'package:gibibooks/widgets/navigation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Navigation_Screen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}

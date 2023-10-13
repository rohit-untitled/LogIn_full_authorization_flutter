import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modern_login/pages/login_page.dart';

import 'home_page.dart';
import 'login_or_registerPage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if(snapshot.hasData){
            return HomePage();
          }
          //user not logged in
          else{
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

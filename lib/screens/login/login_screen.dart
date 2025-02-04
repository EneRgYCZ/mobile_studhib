import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studhub/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studhub/services/firestore.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/Logo.png'),
            LoginButton(
              icon: FontAwesomeIcons.at,
              text: 'Sign in with Email',
              loginMethond: () {
                Navigator.pushNamed(
                  context,
                  '/login_with_email',
                );
              },
              color: Colors.orange,
            ),
            LoginButton(
              icon: FontAwesomeIcons.google,
              text: 'Sign in with Google',
              loginMethond: AuthService().googleLogin,
              color: Colors.blue,
            ),
            if (Platform.isIOS)
              LoginButton(
                icon: FontAwesomeIcons.apple,
                text: 'Sign in with Apple',
                loginMethond: AuthService().signInWithApple,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Function loginMethond;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          UserCredential authResult = loginMethond();
          if (authResult.additionalUserInfo!.isNewUser) {
            FirestoreService().createUserData(authResult.user!.uid);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/profile_setup', (route) => false);
          }
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}

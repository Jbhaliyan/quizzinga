import 'package:flutter/material.dart';
import 'package:quizzinga/widgets/authentication/auth_form.dart';
import 'package:quizzinga/widgets/logo/logo.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);
  static const routeName = '/Authentication';
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      // ignore: prefer_const_constructors
      body: SafeArea(
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Logo(),
              AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}

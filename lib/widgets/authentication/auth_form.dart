import 'package:flutter/material.dart';
import 'package:quizzinga/widgets/buttons/googleButton.dart';
import 'package:quizzinga/widgets/buttons/facebookButton.dart';
import 'package:quizzinga/widgets/buttons/simpleRoundedButton.dart';
import 'package:quizzinga/widgets/inputField/userInput.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  Widget text() {
    return Text(
      '-Or-',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const UserInput(Icons.person_outline, 'UserName'),
            const SizedBox(height: 10),
            const UserInput(Icons.lock_open, 'Password'),

            const SizedBox(height: 10),
            const SimpleRoundedButton('Login'),
            text(),
            // const Text('OR'),
            GoogleButton(),
            // const Text('OR'),
            text(),
            FacebookButton(),

            const SizedBox(height: 10),
            const Align(
                alignment: Alignment.bottomLeft,
                child: Text('New User? Register'))
          ],
        ),
      ),
    );
  }
}
//  ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 primary: Theme.of(context).primaryColor,
//               ),
//               child: const Text('Continue with Facebook'),
//             ),
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:quizzinga/Screens/questionScreen.dart';

import '../authentication/google_sign_in.dart';

class GoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future signIn() async {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        Scaffold.of(context)
            // ignore: deprecated_member_use
            .showSnackBar(const SnackBar(content: Text('Sign in Failed')));
      } else {
        Navigator.pushReplacementNamed(context, Questions.routeName);
      }
    }

    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
        ),
        onPressed: signIn,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/google.svg',
                width: size.width * .08,
              ),
              const SizedBox(width: 10),
              Text(
                'Continue with Google',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ));
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     ElevatedButton.icon(
    //       icon: icon,
    //       label: Text(label),
    // style: ButtonStyle(
    //   padding: MaterialStateProperty.all(
    //     EdgeInsets.symmetric(horizontal: 16),
    //   ),
    //   backgroundColor:
    //       MaterialStateProperty.all(Theme.of(context).primaryColor),
    //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30.0))),
    // ),
    //       onPressed: () {},
    //     ),
    //   ],
    // );
  }
}
// ElevatedButton.icon(
//               onPressed: () {},
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all(Theme.of(context).primaryColor),
//                 shape:

//                     //  ElevatedButton.styleFrom(
//                     //   shape: const OutlinedBorder(side:BorderSide.none)
//                     MaterialStateProperty.all(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0))),
//                 // primary: Theme.of(context).primaryColor,
//               ),
//               icon: const Icon(Icons.home),
//               label: Row(
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [
//                   // ignore: prefer_const_constructors
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 20),
//                     child: const Text('Continue with Google'),
//                   ),
//                 ],
//               ),
//             ),
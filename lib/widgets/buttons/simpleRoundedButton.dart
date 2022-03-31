import 'package:flutter/material.dart';
import '../../Screens/questionScreen.dart';

class SimpleRoundedButton extends StatelessWidget {
  const SimpleRoundedButton(this.buttonText);

  // final Color? color;
  final String buttonText;
  // final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Questions.routeName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(buttonText, style: TextStyle(fontSize: 20))],
          ),
        ));
  }
}

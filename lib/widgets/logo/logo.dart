import 'dart:ui';

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        // height: size.height * .05,
        // color: Colors.black,
        child: RichText(
          text: TextSpan(
              text: 'Q',
              style: TextStyle(
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                TextSpan(
                  text: 'uizzinga',
                  style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput(this.icon, this.hint);
  final IconData? icon;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(
              icon,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: TextField(
              obscureText: hint == 'Password' ? true : false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

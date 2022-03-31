import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FacebookButton extends StatelessWidget {
  // const FacebookButton(
  //     {required this.image, required this.label, required this.color});
  // final String image;
  // final String label;
  // final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue.shade900),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/facebook1.svg',
                color: Colors.white,
                width: size.width * .08,
              ),
              const SizedBox(width: 10),
              Text('Continue with facebook')
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
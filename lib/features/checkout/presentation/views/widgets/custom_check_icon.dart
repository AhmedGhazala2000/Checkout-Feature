import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: -50,
      right: 0,
      left: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xffEDEDED),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff34A853),
          child: Icon(
            Icons.check,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

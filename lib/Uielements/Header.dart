import 'package:flutter/material.dart';
class MyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
          color: Color(0xffD7E5FB),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(700))

      ),
      child: Text(
        "FREQUENTLY\nASKED QUESTIONS"
        ,textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff277CFF),
          fontSize: 20,
        ),
      ),
      alignment: Alignment.center,

    );
  }
}

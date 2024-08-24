import 'package:flutter/material.dart';

class TEXT extends StatelessWidget {
  final String name;
  TEXT({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(fontSize: 35,fontWeight: FontWeight.w700,                              color: Color(0xffDB3022),
      ),
    )
    ;
  }
}

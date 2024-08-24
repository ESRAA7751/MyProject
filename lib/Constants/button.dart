import 'package:flutter/material.dart';

class Button extends StatelessWidget {
final String name;
  final  VoidCallback onpressed ;
   Button({super.key, required this.onpressed, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 9,
                spreadRadius: 1)
          ],
          color: Color(0xffDB3022),
          borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
      ),

    );
  }
}

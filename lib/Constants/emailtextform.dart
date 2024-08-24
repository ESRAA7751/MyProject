import 'package:flutter/material.dart';

class EmailTextForm extends StatelessWidget {
  final TextEditingController myController;


  EmailTextForm({super.key, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 11,
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
          labelText: 'Email',
          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
          prefixIcon: Icon(Icons.email),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Email';
          }
          final bool isValidEmail = RegExp(
              r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$'
          ).hasMatch(value);

          if (!isValidEmail) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }
}

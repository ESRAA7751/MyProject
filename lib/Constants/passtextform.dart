import 'package:flutter/material.dart';

class Passtextform extends StatefulWidget {
  final TextEditingController myController;

  const Passtextform({super.key, required this.myController});

  @override
  State<Passtextform> createState() => _PasstextformState();
}

class _PasstextformState extends State<Passtextform> {
  bool pass = true;
  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 11,
      child: TextFormField(
        controller:  widget.myController,
        obscureText: pass,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          border: InputBorder.none,
          alignLabelWithHint: false,
          fillColor: Colors.white,
          filled: true,
          labelText: 'Password',
          labelStyle:TextStyle(color: Color(0xff9B9B9B)) ,

          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                pass = !pass;
              });
            },
            icon:
            Icon(pass ? Icons.visibility_off : Icons.visibility),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );

  }
}

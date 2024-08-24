import 'package:flutter/material.dart';

class AppdetalisScreen extends StatelessWidget {
  const AppdetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Details',style: TextStyle(
        fontSize: 25,fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'This is an e-commerce application',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

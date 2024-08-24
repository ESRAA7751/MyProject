import 'package:finalproject/Constants/button.dart';
import 'package:finalproject/Constants/emailtextform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatelessWidget {
  ResetScreen({super.key});
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Forget password",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Text(
                    'Please, enter your email address. You will receive a link to create a new password via email.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                EmailTextForm(myController: emailcontroller),
                SizedBox(
                  height: 35,
                ),
                Button(
                  onpressed: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailcontroller.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Password reset email sent.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  name: 'SEND',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

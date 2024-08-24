import 'package:finalproject/Auth/auth.dart';
import 'package:finalproject/Constants/button.dart';
import 'package:finalproject/Constants/emailtextform.dart';
import 'package:finalproject/Constants/passtextform.dart';
import 'package:finalproject/Auth/login_screen.dart';
import 'package:finalproject/bottombar_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Material(
                    elevation: 11,
                    shadowColor: Colors.black38,
                    child: TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none,
                          alignLabelWithHint: false,
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: EmailTextForm(myController: emailcontroller),
                  ),
                  Passtextform(
                    myController: passcontroller,
                  ),
                  SizedBox(height: 30),
                  Button(
                    onpressed: () async {
                      if (formkey.currentState!.validate()) {
                        print(emailcontroller.text);
                        print(passcontroller.text);
                        await registerUser(emailcontroller.text,
                            passcontroller.text, namecontroller.text);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottombarScreen()));
                      }
                    },
                    name: 'SING UP',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0xffDB3022),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

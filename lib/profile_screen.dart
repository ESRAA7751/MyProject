import 'package:finalproject/Auth/auth.dart';
import 'package:finalproject/Auth/login_screen.dart';
import 'package:finalproject/Constants/textconstant.dart';
import 'package:finalproject/screens/aboutdetalis_screen.dart';
import 'package:finalproject/screens/appdetalis_screen.dart';
import 'package:finalproject/screens/privacy_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    GetUserData();
  }

  Future<void> GetUserData() async {
    Map<String, dynamic>? userData = await getUserData();
    setState(() {
      userName = userData?['name'] ?? 'No Name';
      userEmail = userData?['email'] ?? 'No Email';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TEXT(
                name: 'Profile',
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Welcome $userName',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  userEmail ?? '',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ),
              Divider(
                height: 30,
                thickness: 3,
              ),
              ListTile(
                leading: Icon(Icons.help, size: 30),
                title: Text(
                  'Help & Support',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PrivacyScreen()));
                },
                leading: Icon(Icons.privacy_tip, size: 30),
                title: Text(
                  'Privacy',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                leading: Icon(Icons.settings, size: 30),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutdetalisScreen()));
                },
                leading: Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppdetalisScreen()));
                },
                leading: Icon(Icons.info_outline_rounded, size: 30),
                title: Text(
                  'About App',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              Divider(
                height: 50,
                thickness: 3,
              ),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                leading: Icon(
                  Icons.logout,
                  size: 30,
                  color: Color(0xffDB3022),
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

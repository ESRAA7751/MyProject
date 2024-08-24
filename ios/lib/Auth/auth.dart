
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Auth/login_screen.dart';
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

  Future<void> saveUserData(String userId, String name, String email) async {
    await FirebaseFirestore.instance.collection('client').doc(userId).set({
      'name': name,
      'email': email,
    });
  }

  Future<void> registerUser(String email, String password, String name) async {
    try {
      final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword( email: email,
        password: password,
      );

      User? user = credential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();

        await saveUserData(user.uid, name, email);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print(
            'The account already exists for that email.');
      }
    }
    catch (e) {
      print('Error: $e');
    }
  }Future<Map<String, dynamic>?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
          .collection('client')
          .doc(user.uid)
          .get();
      return userData.data();
    }

    return null; // في حالة إذا كان `user` null
  }
    Future<void> deleteAccount(BuildContext context) async {
      try {
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {

          await FirebaseFirestore.instance.collection('client').doc(user.uid).delete();

          await user.delete();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Account deleted successfully'),
          ));

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to delete account: $e'),
        ));
      }
    }


import 'package:daytasker/pages/login_register.dart';
import 'package:daytasker/pages/todo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return TodoPage();
          }
          else{
            return LoginRegister();
          }
        }

      )
    );
  }
}
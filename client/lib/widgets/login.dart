import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({ super.key });

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login>{

  @override
  Widget build(BuildContext context){
    return const Text("Login widget");
  }
}
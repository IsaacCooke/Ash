import 'package:client/pages/layout.dart';
import 'package:flutter/material.dart';

import 'package:client/global/global.dart' as globals;

import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/data/models/user.dart';
import 'package:client/data/services/user_service.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = "";

  void nextPage(BuildContext context){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: ((context) => const Layout())),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "${context.loc.enterYour} ${context.loc.email}",
                  labelText: context.loc.email,
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "${context.loc.enterYour} ${context.loc.password}",
                  labelText: context.loc.password,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(errorMessage),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: () async {
                    UserService userService = UserService();
                    String email = _emailController.toString();
                    String password = _emailController.toString();

                    List<User>? users = await userService.getUsers();

                    for(User user in users!){
                      if((user.email == email) && (user.password == password)){
                        globals.setUser = user;

                        nextPage(context);
                      } else{
                        // Failure
                      }
                      setState(() {
                        errorMessage = context.loc.incorrectEmailAddressOrPassword;
                      });
                    }
                  },
                  child: Text(context.loc.submit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
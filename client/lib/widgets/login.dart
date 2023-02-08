import 'package:client/pages/layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:client/global/global.dart' as globals;

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

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context).enterYour} ${AppLocalizations.of(context).email}",
                  labelText: AppLocalizations.of(context).email,
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context).enterYour} ${AppLocalizations.of(context).password}",
                  labelText: AppLocalizations.of(context).password,
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

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: ((context) => const Layout())),
                        );
                      } else{
                        // Failure
                      }
                      setState(() {
                        errorMessage = AppLocalizations.of(context).incorrectEmailAddressOrPassword;
                      });
                    }
                  },
                  child: Text(AppLocalizations.of(context).submit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
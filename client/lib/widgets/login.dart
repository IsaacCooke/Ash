import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  State<Login> createState() => LoginState();
}

class LoginState extends State<Login>{
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.email}",
                  labelText: AppLocalizations.of(context)!.email,
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.password}",
                  labelText: AppLocalizations.of(context)!.password,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
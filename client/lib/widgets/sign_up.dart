import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:client/data/models/user.dart';
import 'package:client/data/services/user_service.dart';
import 'package:client/widgets/login.dart';
import 'package:client/widgets/terms_and_conditions.dart';

class SignUp extends StatefulWidget{
  const SignUp({ super.key });

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp>{
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _dateController = TextEditingController();
  bool _hasAgreedToConditions = false;
  DateTime _dateOfBirth = DateTime.now();

  @override
  void initState(){
    _dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signUp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.firstName}",
                  labelText: AppLocalizations.of(context)!.firstName,
                ),
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.lastName}",
                  labelText: AppLocalizations.of(context)!.lastName,
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.email}",
                  labelText: AppLocalizations.of(context)!.email,
                ),
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.phoneNumber}",
                  labelText: AppLocalizations.of(context)!.phoneNumber,
                ),
              ),
              TextFormField(
                controller: _passwordController1,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.password}",
                  labelText: AppLocalizations.of(context)!.password,
                ),
              ),
              TextFormField(
                controller: _passwordController2,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.confirmYourPassword,
                  labelText: AppLocalizations.of(context)!.confirmPassword,
                ),
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  hintText: "${AppLocalizations.of(context)!.enterYour} ${AppLocalizations.of(context)!.dateOfBirth}",
                  labelText: AppLocalizations.of(context)!.dateOfBirth,
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );

                  if(pickedDate != null){
                    print(pickedDate);
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(formattedDate);

                    setState(() {
                      _dateController.text = formattedDate;
                      _dateOfBirth = pickedDate;
                    });
                  } else {
                    print("No date selected");
                  }
                },
              ),
              CheckboxListTile(
                // title: Text("${AppLocalizations.of(context)!.byCheckingThisBoxYouConfirmYouHaveReadThe} ${AppLocalizations.of(context)!.termsAndConditions}"),
                title: ElevatedButton(
                  child: Text("${AppLocalizations.of(context)!.byCheckingThisBoxYouConfirmYouHaveReadThe} ${AppLocalizations.of(context)!.termsAndConditions}"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: ((context) => const TermsAndConditions())),
                    );
                  },
                ),
                value: _hasAgreedToConditions,
                onChanged: (bool? value){
                  setState(() {
                    _hasAgreedToConditions = value!;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: (){
                    String firstName = _firstNameController.toString();
                    String lastName = _firstNameController.toString();
                    String email = _emailController.toString();
                    String phoneNumber = _phoneNumberController.toString();
                    String password1 = _passwordController1.toString();
                    String password2 = _passwordController2.toString();
                    DateTime dateOfBirth = _dateOfBirth;

                    if(password1 != password2){
                      throw Exception("Passwords do not match");
                    }

                    User newUser = User(
                      firstName: firstName,
                      lastName: lastName,
                      email: email,
                      password: password1,
                      phoneNumber: phoneNumber,
                      hasAgreedToConditions: _hasAgreedToConditions,
                      birthDate: dateOfBirth,
                    );

                    UserService userService = UserService();
                    userService.createUser(newUser);
                  },
                  child: Text(AppLocalizations.of(context)!.submit),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  const Settings({ super.key });

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings>{

  @override
  Widget build(BuildContext context){
    return const Text("This is the settings page");
  }
}
import 'package:flutter/material.dart';

class Reminders extends StatefulWidget{
  const Reminders({ super.key });

  @override
  State<Reminders> createState() => RemindersState();
}

class RemindersState extends State<Reminders>{

  @override
  Widget build(BuildContext context){
    return const Text("This is the reminders page");
  }
}
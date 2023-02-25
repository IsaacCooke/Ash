import 'package:client/data/services/reminder_service.dart';
import 'package:flutter/material.dart';

import 'package:client/data/models/reminder.dart';
import 'package:client/l10n/app_localizations_context.dart';
import 'package:intl/intl.dart';


class CreateReminder extends StatefulWidget {
  const CreateReminder({super.key});

  @override
  State<CreateReminder> createState() => _CreateReminderState();
}

class _CreateReminderState extends State<CreateReminder>{
  final _titleController = TextEditingController();
  final _repeatController = TextEditingController();
  final _dateDueController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _dateDue = DateTime.now();

  @override
  void initState(){
    _dateDueController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.newReminder),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "${context.loc.enterThe} ${context.loc.title}",
                  labelText: context.loc.title,
                ),
              ),
              TextFormField(
                controller: _repeatController,
              ),
              TextFormField(
                controller: _dateDueController,
                decoration: InputDecoration(
                  hintText: "${context.loc.enterThe} ${context.loc.dateDue}",
                  labelText: context.loc.dateDue,
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if(pickedDate != null){
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      _dateDueController.text = formattedDate;
                      _dateDue = pickedDate;
                    });
                  } else {
                    throw Exception("That's not a valid date");
                  }
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(
                  hintText: "${context.loc.enterAny} ${context.loc.notes}",
                  labelText: context.loc.notes
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    String title = _titleController.toString();
                    DateTime dateDue = _dateDue;
                    String notes = _notesController.toString();

                    Reminder newReminder = Reminder(
                      title: title,
                      dateDue: dateDue,
                      repeat: Repeat.none,
                      notes: notes,
                    );

                    ReminderService reminderService = ReminderService();
                    reminderService.createReminder(newReminder);
                    Navigator.pop(context);
                  },
                  child: Text(context.loc.submit),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
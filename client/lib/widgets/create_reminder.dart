import 'package:flutter/material.dart';

import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/global/global.dart' as globals;
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
  final _locationController = TextEditingController();
  DateTime _dateDue = DateTime.now();

  @override
  void initState(){
    _dateDueController.text = "";
    super.initState();
  }

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
                  hintText: context.loc.enterThe + context.loc.title,
                  labelText: context.loc.title,
                ),
              ),
              TextFormField(
                controller: _repeatController,
                //TODO Do something here so the user gets an option not just a text box
              ),
              TextFormField(
                controller: _dateDueController,
                decoration: InputDecoration(
                  hintText: context.loc.enterThe + context.loc.dateDue,
                  labelText: context.loc.dateDue,
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  ); //TODO Make this a date and time thing. Atm it's just date

                  if(pickedDate != null){
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      _dateDueController.text = formattedDate;
                      _dateDue = pickedDate;
                    });
                  } else {
                    //TODO Add something else here (same as sign_up.dart)
                  }
                },
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(
                  hintText: context.loc.enterAny + context.loc.notes,
                  labelText: context.loc.notes
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              //TODO Add location text field
            ],
          ),
        )
      ),
    );
  }
}
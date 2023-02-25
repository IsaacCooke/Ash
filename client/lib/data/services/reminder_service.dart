import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:client/data/models/reminder.dart';
import 'package:client/data/services/constants.dart';

class ReminderService{
  Future<List<Reminder>?> getReminders() async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.remindersEndpoint)
    );

    if(response.statusCode == 200){
      List<Reminder> reminders = reminderFromJson(response.body);
      return reminders;
    } else {
      throw Exception("Failed to load reminders");
    }
  }

  Future<Reminder> getReminderById(int id) async {
    final response = await http.get(
      Uri.parse("${ApiConstants.baseUrl}${ApiConstants.remindersEndpoint}/$id"),
    );

    if(response.statusCode == 200){
      return Reminder.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load reminder with id $id"); //! Need to hide id before the final build
    }
  }

  Future<Reminder> createReminder(Reminder newReminder) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.remindersEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'title': newReminder.title,
        'dateDue': newReminder.dateDue,
        'notes': newReminder.notes,
        'repeat': newReminder.repeat,
      }),
    );

    if(response.statusCode == 200){
      return Reminder.fromJson(jsonDecode(response.body));
    } else {
        throw Exception("Could not create new reminder");
    }
  }
  
  Future<Reminder> updateReminder(Reminder updatedReminder, int id) async {
    final response = await http.put(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.remindersEndpoint}/$id'),
        headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'id': updatedReminder.id,
        'title': updatedReminder.title,
        'dateDue': updatedReminder.dateDue,
        'notes': updatedReminder.notes,
        'repeat': updatedReminder.repeat,
      }),
    );

    if(response.statusCode == 200){
      return Reminder.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update reminder"); 
    }
  }

  Future<Reminder> deleteReminder(int id) async {
    final http.Response response = await http.delete(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.remindersEndpoint}/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF',
      },
    );

    if(response.statusCode == 200){
      return Reminder.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to delete reminder");
    }
  }
}

import 'dart:convert';


List<Reminder> reminderFromJson(String str) =>
  List<Reminder>.from(json.decode(str).map((x) => Reminder.fromJson(x)));

String reminderToJson(List<Reminder> data) =>
  json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class Reminder{
  final int? id;
  final String title;
  final DateTime dateDue;
  final Repeat repeat;
  final String notes;

  const Reminder({
    this.id,
    required this.title,
    required this.dateDue,
    required this.repeat,
    required this.notes,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    id: json['id'],
    title: json['title'],
    dateDue: json['dateDue'],
    repeat: json['repeat'],
    notes: json['notes'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'dateDue': dateDue,
    'repeat': repeat,
    'notes': notes,
  };
}

enum Repeat
{
  none,
  daily,
  weekly,
  monthly,
  weekdays,
  weekends,
  yearly,
}
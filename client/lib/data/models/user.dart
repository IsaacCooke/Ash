import 'dart:convert';

import 'package:client/data/models/address.dart';
import 'package:client/data/models/langauges.dart';
import 'package:client/data/models/reminder.dart';
import 'package:client/data/models/settings.dart';

List<User> userFromJson(String str) =>
  List<User>.from(json.decode(str).map((e) => User.fromJson(e)));

String userToJson(List<User> data) =>
  json.encode(List<dynamic>.from(data.map((e) => e.toJson)));


class User{
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phoneNumber;
  final bool hasAgreedToConditions;
  final Languages language;
  final Address address;
  final Settings settings;
  final DateTime birthDate;
  final List<Reminder> reminders;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.hasAgreedToConditions,
    required this.language,
    required this.address,
    required this.settings,
    required this.birthDate,
    required this.reminders,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    password: json['password'],
    phoneNumber: json['phoneNumber'],
    hasAgreedToConditions: json['hasAgreedToConditions'],
    language: json['language'],
    address: Address.fromJson(json['address']),
    settings: Settings.fromJson(json['settings']),
    birthDate: json['birthDate'],
    reminders: [Reminder.fromJson(json['reminders'])],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
    'hasAgreedToConditions': hasAgreedToConditions,
    'language': language,
    'address': address.toJson(),
    'settings': settings.toJson(),
    'birthDate': birthDate,
    'reminders': reminders,
  };
}
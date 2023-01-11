import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:client/data/models/user.dart';
import 'package:client/data/services/constants.dart';

class UserService{
  Future<List<User>?> getUsers() async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint)
    );
    
    if(response.statusCode == 200){
      List<User> _users = userFromJson(response.body);
      print(_users);
      return _users;
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> getUserById(int id) async {
    final response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint + '/$id'),
    );

    if(response.statusCode == 200){
      print(response);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load user with is $id"); //! Needs to hide id before final build
    }
  }

  Future<User> createUser(User newUser) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstName': newUser.firstName,
        'lastName': newUser.lastName,
        'email': newUser.email,
        'password': newUser.password,
        'phoneNumber': newUser.phoneNumber,
        'hasAgreedToConditions': newUser.hasAgreedToConditions,
        'language': newUser.language,
        'address': newUser.address!.toJson(),
        'settings': newUser.settings!.toJson(),
        'birthDate': newUser.birthDate,
        'reminders': newUser.reminders,
      }),
    );

    if(response.statusCode == 201){
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }

  Future<User> updateUser(int id, User updatedUser) async {
    final response = await http.put(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint + "/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': updatedUser.id,
        'firstName': updatedUser.firstName,
        'lastName': updatedUser.lastName,
        'email': updatedUser.email,
        'password': updatedUser.password,
        'phoneNumber': updatedUser.phoneNumber,
        'hasAgreedToConditions': updatedUser.hasAgreedToConditions,
        'language': updatedUser.language,
        'address': updatedUser.address!.toJson(),
        'settings': updatedUser.settings!.toJson(),
        'birthDate': updatedUser.birthDate,
        'reminders': updatedUser.reminders,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
}

  Future<User> deleteUser(int id) async {
    final http.Response response = await http.delete(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint + "/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("User not deleted");
    }
  }
}
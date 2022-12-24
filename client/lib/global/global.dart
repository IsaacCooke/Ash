library globals;

import 'package:client/data/models/user.dart';

bool isSignedIn = false;
User? user;

bool get getIsSignedIn{
  return isSignedIn;
}

set setIsSignedIn(bool isSignedInNow){
  isSignedIn = isSignedInNow;
}

User get getUser{
  return user!;
}

set setUser(User newUser){
  user = newUser;
}
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState{}

class UserInitial extends UserState{}

class UserLoaded extends UserState{
  final User? user;

  UserLoaded({required this.user});
}

class UserError extends UserState{}
import 'package:chaty_demo/models/user.dart' as user_model;

abstract class UserEvent{}

class GetCurrentUser extends UserEvent{}

class RegisterUser extends UserEvent{
  final user_model.User? user;

  RegisterUser({required this.user});
}

class LoginUser extends UserEvent{
  final user_model.User user;

  LoginUser({required this.user});
}
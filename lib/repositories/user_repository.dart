import 'package:chaty_demo/models/user.dart' as user_model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<void> registerUser(user_model.User? user) async{
    try{
      var credential = await _auth.createUserWithEmailAndPassword(email: user!.email, password: user!.password);
      if(credential == null){
        debugPrint('kullanıcı oluşturulamadı.');
      }
    }catch(exception){
      print('register error!');
    }
  }

  User? getCurrentUser() {
     var user = _auth.currentUser;

     return user;
  }

  Future<void> loginUser(user_model.User user) async {
     try{
       await _auth.signInWithEmailAndPassword(email: user.email, password: user.password);
     }catch (exception){
       print('login error');
     }
  }
}
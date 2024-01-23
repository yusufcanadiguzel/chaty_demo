import 'package:chaty_demo/bloc/message_bloc/message_bloc.dart';
import 'package:chaty_demo/bloc/user_bloc/user_bloc.dart';
import 'package:chaty_demo/firebase_options.dart';
import 'package:chaty_demo/screens/login_screen.dart';
import 'package:chaty_demo/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        BlocProvider<MessageBloc>(
            create: (context) => MessageBloc(),
        ),
      ],
      child: const MaterialApp(
        title: 'Chaty Demo',
        home: LoginScreen(),
      ),
  ),
);
}
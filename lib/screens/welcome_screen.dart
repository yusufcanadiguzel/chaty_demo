import 'package:chaty_demo/bloc/message_bloc/message_bloc.dart';
import 'package:chaty_demo/bloc/message_bloc/message_state.dart';
import 'package:chaty_demo/bloc/user_bloc/user_bloc.dart';
import 'package:chaty_demo/bloc/user_bloc/user_event.dart';
import 'package:chaty_demo/bloc/user_bloc/user_state.dart';
import 'package:chaty_demo/screens/message_screen.dart';
import 'package:chaty_demo/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserInitial){
              print(state.toString());
              context.read<UserBloc>().add(GetCurrentUser());
            }

            if(state is UserLoaded){
              if(state.user == null){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),),);
              }else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MessageScreen(),),);
              }
            }

            if(state is UserError){

            }

            return Text('Unknown state!');
          },
      ),
    );
  }
}

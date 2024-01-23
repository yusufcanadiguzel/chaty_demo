import 'package:chaty_demo/bloc/user_bloc/user_bloc.dart';
import 'package:chaty_demo/bloc/user_bloc/user_event.dart';
import 'package:chaty_demo/bloc/user_bloc/user_state.dart';
import 'package:chaty_demo/screens/message_screen.dart';
import 'package:chaty_demo/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chaty_demo/models/user.dart' as user_model;
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if(state is UserInitial){
            context.read<UserBloc>().add(GetCurrentUser());
          }

          if(state is UserLoaded){
            var email = '';
            var password = '';

            return SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Kayıt Ol', style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: CustomTextField(
                                textValue: email,
                                labelText: 'Email',
                                iconData: const Icon(Icons.mail),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: CustomTextField(
                                isObscure: true,
                                textValue: password,
                                labelText: 'Şifre',
                                iconData: const Icon(Icons.lock),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<UserBloc>().add(RegisterUser(user: user_model.User(email: email, password: password)));
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const MessageScreen(),));
                            },
                            child: const Text('Kayıt Ol'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          if(state is UserError){
            return Container();
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

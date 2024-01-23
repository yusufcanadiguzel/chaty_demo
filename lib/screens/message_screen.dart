import 'package:chaty_demo/bloc/message_bloc/message_bloc.dart';
import 'package:chaty_demo/bloc/message_bloc/message_event.dart';
import 'package:chaty_demo/bloc/message_bloc/message_state.dart';
import 'package:chaty_demo/constants/constants.dart';
import 'package:chaty_demo/models/message.dart';
import 'package:chaty_demo/widgets/bottom_text_area.dart';
import 'package:chaty_demo/widgets/message_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MessageBox createMessage(Message message) {
    //final List<Widget> messageBoxes = [];

    // for(var message in messages){
    //   messageBoxes.add(MessageBox(
    //       boxColor: message.sender == _auth.currentUser!.email ? Colors.blue : Colors.blueGrey,
    //       messageText: message.text,
    //       borderRadius: message.sender == _auth.currentUser!.email ? Constants.senderRadius : Constants.receiverRadius));
    // }

    return MessageBox(
        boxColor: message.sender == _auth.currentUser!.email ? Colors.blue : Colors.blueGrey,
        messageText: message.text,
        borderRadius: message.sender == _auth.currentUser!.email ? Constants.senderRadius : Constants.receiverRadius,
        isSender: message.sender == _auth.currentUser!.email);

    //return messageBoxes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, state){
            if(state is MessageInitial){
              context.read<MessageBloc>().add(GetMessages());
            }

            if(state is MessageLoaded){
              var stream = state.messageStream;
              var text = '';
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: StreamBuilder(
                        stream: stream,
                        builder: (context, message) {
                          if(!message.hasData){
                            return Container();
                          }

                          var messages = message.data!.docs;
                          return ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (_, index) {
                              return createMessage(Message(
                                  text: messages[index].data()['text'],
                                  receiver: messages[index].data()['receiver'],
                                  sender: messages[index].data()['sender']));
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: TextField(
                                onChanged: (value) => text = value,
                                maxLines: null,
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder()
                                ),
                              ),
                            ),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.orange,
                            shape: const CircleBorder(),
                            child: const Icon(Icons.send),
                            onPressed: () {
                              context.read<MessageBloc>().add(AddMessage(message:
                                  Message(text: text, receiver: null, sender: _auth.currentUser!.email!)));
                              // setState(() {
                              //   context.read<MessageBloc>().add(AddMessage(message:
                              //   Message(text: text, receiver: null, sender: _auth.currentUser!.email!)));
                              //
                              //   context.read<MessageBloc>().add(GetMessages());
                              // });
                            } ,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            if(state is MessageError){
              return const Text('UserError state');
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}

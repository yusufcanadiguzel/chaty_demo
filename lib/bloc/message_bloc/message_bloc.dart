import 'package:chaty_demo/bloc/message_bloc/message_event.dart';
import 'package:chaty_demo/bloc/message_bloc/message_state.dart';
import 'package:chaty_demo/repositories/message_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState>{
  MessageBloc() : super(MessageInitial()){
    on<GetMessages>(_onGetMessagesStream);
    on<AddMessage>(_onAddMessage);
    on<GetMessagesStream>(_onGetMessagesStream);
  }
}

final MessageRepository _repository = MessageRepository();

  void _onGetMessages(GetMessages event, Emitter<MessageState> emitter) async {
    try{
      final messages = await _repository.getMessages();
      //emitter(MessageLoaded(messages: messages));
    }catch (exception) {
      emitter(MessageError());
    }
    print('_onGetMessages');
  }

  void _onAddMessage(AddMessage event, Emitter<MessageState> emitter) async {
    try{
      await _repository.addMessage(event.message);
    }catch (exception){
      emitter(MessageError());
    }
  }

  void _onGetMessagesStream(MessageEvent event, Emitter<MessageState> emitter) async {
    try{
      Stream<QuerySnapshot<Map<String, dynamic>>> messageStream = await _repository.getMessagesStream();
      emitter(MessageLoaded(messageStream: messageStream));
    }catch (exception){
      emitter(MessageError());
    }
  }


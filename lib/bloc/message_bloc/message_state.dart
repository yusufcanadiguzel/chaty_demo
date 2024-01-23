import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/message.dart';

abstract class MessageState{}

class MessageInitial extends MessageState{}

class MessageLoading extends MessageState{}

class MessageLoaded extends MessageState{
  //final List<Message> messages;
  final Stream<QuerySnapshot<Map<String, dynamic>>> messageStream;

  MessageLoaded({required this.messageStream});
}

class MessageError extends MessageState{}
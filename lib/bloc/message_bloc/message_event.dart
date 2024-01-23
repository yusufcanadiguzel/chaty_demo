import '../../models/message.dart';

abstract class MessageEvent{}

class GetMessages extends MessageEvent{}

class GetMessagesStream extends MessageEvent{}

class AddMessage extends MessageEvent{
  final Message message;

  AddMessage({required this.message});
}
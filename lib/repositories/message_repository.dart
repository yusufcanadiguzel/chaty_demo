import 'package:chaty_demo/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository{
  static const String collectionName = 'messages';

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addMessage(Message message) async{
    try{
      await _firebaseFirestore.collection(collectionName).add({
        'text': message.text,
        'sender': message.sender,
        'receiver': message.receiver,
      });
      print('add message worked');
    }catch(exception){
      print('message send error!');
    }
  }

  Future<List<Message>> getMessages() async {
    List<Message> messages = [];

    var messageCollection = await _firebaseFirestore.collection(collectionName).get();

    for (var element in messageCollection.docs) {
      messages.add(Message(text: element.data()['text'], receiver: element.data()['receiver'], sender: element.data()['sender']));
    }

    return messages;
  }

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getMessagesStream() async {
    var messageStream = _firebaseFirestore.collection(collectionName).snapshots();

    return messageStream;
  }
}
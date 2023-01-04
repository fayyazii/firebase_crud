import 'package:cloud_firestore/cloud_firestore.dart';

class receiveMessageRepo {
  static Stream<QuerySnapshot<Map<String, dynamic>>> receiveMessage()  {
    var message_listner =
         FirebaseFirestore.instance.collection('messages').snapshots();
    return message_listner;
  }
}

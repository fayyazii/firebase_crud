import 'package:cloud_firestore/cloud_firestore.dart';

class messageRepo
{
  static Future sendData(Map<String,dynamic> data )async
  {
    var msg = await FirebaseFirestore.instance.collection('messages').add(data);

  }
}
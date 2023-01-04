
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPersonRepo
{
  static Future<bool?> addPerson(Map<String,dynamic> personData)async{
      await FirebaseFirestore.instance.collection("persons").add(personData);
      return true;
  }
}
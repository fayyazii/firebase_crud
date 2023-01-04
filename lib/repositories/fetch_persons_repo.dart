import 'package:cloud_firestore/cloud_firestore.dart';

class FetchPersonsRepo {
  static Future<Stream<QuerySnapshot<Map<String,dynamic>>>> getData() async {
    var dataListener =
        FirebaseFirestore.instance.collection("persons").snapshots();
    return dataListener;
  }
}

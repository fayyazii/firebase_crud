import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class QrScanRepo {
  static Future<QuerySnapshot<Map<String, dynamic>>> getdata(String mycode) async {
    var code = await FirebaseFirestore.instance
        .collection('qrscan')
        .where("code", isEqualTo: mycode)
        .get();

    return code;

  }
}

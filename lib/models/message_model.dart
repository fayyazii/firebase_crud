// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class MessageModel {
  MessageModel({
    required this.receiver,
    required this.sender,
    required this.message,
  });

  String receiver;
  String sender;
  String message;

  factory MessageModel.fromRawJson(String str) => MessageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    receiver: json["receiver"],
    sender: json["sender"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "receiver": receiver,
    "sender": sender,
    "message": message,
  };
}


// To parse this JSON data, do
//
//     final participantModel = participantModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ParticipantModel {
  ParticipantModel({
    required this.code,
    required this.name,
    required this.participant,
  });

  String code;
  String name;
  String participant;

  factory ParticipantModel.fromRawJson(String str) => ParticipantModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ParticipantModel.fromJson(Map<String, dynamic> json) => ParticipantModel(
    code: json["code"],
    name: json["name"],
    participant: json["participant"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "participant": participant,
  };
}

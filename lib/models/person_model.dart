// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class PersonModel {
  PersonModel({
    required this.name,
    required this.email,
    required this.age,
  });

  String name;
  String email;
  String age;

  factory PersonModel.fromRawJson(String str) => PersonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    name: json["name"],
    email: json["email"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "age": age,
  };
}

// To parse this JSON data, do
//
//     final partner = partnerFromJson(jsonString);

import 'dart:convert';

PartnerModel partnerFromJson(String str) => PartnerModel.fromJson(json.decode(str));

String partnerToJson(PartnerModel data) => json.encode(data.toJson());

class PartnerModel {
  String id;
  String firstname;
  String lastname;
  String gender;
  int country;
  String phone;
  String email;
  String validationCode;
  String password;
  String passwordConfirmation;

  PartnerModel({
    this.id,
    this.firstname,
    this.lastname,
    this.gender,
    this.country,
    this.phone,
    this.email,
    this.validationCode,
    this.password,
    this.passwordConfirmation,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"] ?? null,
    country: json["country"] ?? null,
    phone: json["phone"],
    email: json["email"] ?? null,
    validationCode: json["validationCode"] ?? null,
    password: json["password"],
    passwordConfirmation: json["passwordConfirmation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender ?? null,
    "country": country ?? null,
    "phone": phone,
    "email": email ?? null,
    "validationCode": validationCode ?? null,
    "password": password,
    "passwordConfirmation": passwordConfirmation,
    };
}

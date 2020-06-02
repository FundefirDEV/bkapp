// To parse this JSON data, do
//
//     final partner = partnerFromJson(jsonString);

import 'dart:convert';

Partner partnerFromJson(String str) => Partner.fromJson(json.decode(str));

String partnerToJson(Partner data) => json.encode(data.toJson());

class Partner {
  String firstname;
  String lastname;
  String gender;
  int country;
  String phone;
  String email;
  String validationCode;
  String password;
  String passwordConfirmation;

  Partner({
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

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    country: json["country"],
    phone: json["phone"],
    email: json["email"],
    validationCode: json["validationCode"],
    password: json["password"],
    passwordConfirmation: json["passwordConfirmation"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "country": country,
    "phone": phone,
    "email": email,
    "validationCode": validationCode,
    "password": password,
    "passwordConfirmation": passwordConfirmation,
    };
}

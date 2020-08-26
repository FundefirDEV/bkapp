// To parse this JSON data, do
//
//     final partner = partnerFromJson(jsonString);

import 'dart:convert';

PartnerModel partnerFromJson(String str) => PartnerModel.fromJson(json.decode(str));

String partnerToJson(PartnerModel data) => json.encode(data.toJson());

class PartnerModel {
  int id;
  String firstname;
  String lastname;
  String gender;
  int country;
  String phone;
  String email;
  String validationCode;
  String password;
  String passwordConfirmation;
  int isActive;
  String role;

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
    this.isActive,
    this.role
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"] != null ? json["lastname"] : null,
    gender: json["gender"] != null ? json["gender"] : null,
    country: json["country"] != null ? json["country"] : null,
    phone: json["phone"],
    email: json["email"] != null ? json["email"] : null,
    validationCode: json["validationCode"] != null ? json["validationCode"] : null,
    password: json["password"] != null ? json["password"] : null,
    passwordConfirmation: json["passwordConfirmation"] != null ? json["passwordConfirmation"] : null,
    isActive: json["isActive"] != null ? json["isActive"] : null,
    role: json["role"] != null ? json["role"] : null
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname != null ? lastname : null,
    "gender": gender != null ? gender : null,
    "country": country != null ? country : null,
    "phone": phone,
    "email": email != null ? email : null,
    "validationCode": validationCode != null ? validationCode : null,
    "password": password != null ? password : null,
    "passwordConfirmation": passwordConfirmation != null ? passwordConfirmation : null,
    "isActive": isActive != null ? isActive : null,
    "role": role != null ? role : null,
    };
}

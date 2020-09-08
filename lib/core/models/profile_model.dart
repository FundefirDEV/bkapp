import 'dart:convert';

import 'package:intl/intl.dart';

ProfileModel profileModelFromJson(Map<String, dynamic> data) =>
    ProfileModel.fromJson(data);

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

final formatConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 2, symbol: r'$');

final numberConfig =
    NumberFormat.currency(locale: 'en_US', decimalDigits: 0, symbol: '');

class ProfileModel {
  ProfileModel({
    this.firstname,
    this.lastname,
    this.gender,
    this.country,
    this.phone,
    this.email,
    this.documentNumber,
    this.scholarship,
    this.profession,
    this.birthDate,
    this.earnings,
    this.activeCredit,
    this.shares,
  });

  String firstname;
  String lastname;
  String gender;
  Country country;
  String phone;
  String email;
  String documentNumber;
  String scholarship;
  String profession;
  String birthDate;
  String earnings;
  String activeCredit;
  String shares;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        firstname: json["firstname"] ?? null,
        lastname: json["lastname"] ?? null,
        gender: json["gender"] ?? null,
        country: Country.fromJson(json["country"]),
        phone: json["phone"] ?? null,
        email: json["email"] ?? null,
        documentNumber: json["documentNumber"] ?? null,
        scholarship: json["scholarship"] ?? null,
        profession: json["profession"] ?? null,
        birthDate: json["birthDate"] ?? null,
        earnings: json["earnings"] != null
            ? formatConfig.format(json["earnings"])
            : "r\0",
        activeCredit: json["activeCredit"] != null
            ? formatConfig.format(json["activeCredit"])
            : "r\0",
        shares: json["shares"] != null
            ? numberConfig.format(json["shares"])
            : "r\0",
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "country": country.toJson(),
        "phone": phone,
        "email": email,
        "documentNumber": documentNumber,
        "scholarship": scholarship,
        "profession": profession,
        "birthDate": birthDate,
        "earnings": earnings,
        "activeCredit": activeCredit,
        "shares": shares,
      };
}

class Country {
  Country({
    this.id,
    this.iso,
    this.name,
  });

  int id;
  String iso;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        iso: json["iso"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iso": iso,
        "name": name,
      };
}

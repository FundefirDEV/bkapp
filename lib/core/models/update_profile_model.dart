import 'dart:convert';

UpdatePeofile updatePeofileFromJson(Map<String, dynamic> data) =>
    UpdatePeofile.fromJson(data);

String updatePeofileToJson(UpdatePeofile data) => json.encode(data.toJson());


class UpdatePeofile {
  UpdatePeofile({
    this.firstname,
    this.lastname,
    this.gender,
    this.phone,
    this.email,
  });

  String firstname;
  String lastname;
  String gender;
  String phone;
  String email;

  factory UpdatePeofile.fromJson(Map<String, dynamic> json) => UpdatePeofile(
    firstname: json["firstname"] ?? null,
    lastname: json["lastname"] ?? null,
    gender: json["gender"] ?? null,
    phone: json["phone"] ?? null,
    email: json["email"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "phone": phone,
    "email": email,
    "username" : email,
  };
}
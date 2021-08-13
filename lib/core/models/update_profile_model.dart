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
    this.documentNumber,
    this.birthDate,
    this.profession,
    this.scholarship,
  });

  String firstname;
  String lastname;
  String gender;
  String phone;
  String email;
  String documentNumber;
  int scholarship;
  String profession;
  String birthDate;

  factory UpdatePeofile.fromJson(Map<String, dynamic> json) => UpdatePeofile(
    firstname: json["firstname"] ?? null,
    lastname: json["lastname"] ?? null,
    gender: json["gender"] ?? null,
    phone: json["phone"] ?? null,
    email: json["email"] ?? null,
    documentNumber:json["documentNumber"] ?? null,
    scholarship:json["scholarship"] ?? null,
    profession:json["profession"] ?? null,
    birthDate: json["birthDate"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "phone": phone,
    "email": email,
    "username" : email,
    "documentNumber": documentNumber,
    "scholarship" : scholarship,
    "profession": profession,
    "birthDate" : birthDate,
  };
}
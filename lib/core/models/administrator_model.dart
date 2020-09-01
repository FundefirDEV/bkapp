import 'dart:convert';

List<dynamic> administratorModelFromJson(List<dynamic> str) =>
    List<dynamic>.from(str.map((x) => AdministratorModel.fromJson(x)));

String administratorModelToJson(List<dynamic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdministratorModel {
  AdministratorModel({
    this.phone,
    this.name,
    this.isActive,
    this.role,
  });

  String phone;
  String name;
  bool isActive;
  String role;

  factory AdministratorModel.fromJson(Map<String, dynamic> json) =>
      AdministratorModel(
        phone: json["phone"] != null ? json["phone"] : null,
        name: json["name"] != null ? json["name"] : null,
        isActive: json["isActive"] != null ? json["isActive"] : false,
        role: json["role"] != null ? json["role"] : null,
      );

  Map<String, dynamic> toJson() => {
        "phone": phone != null ? phone : null,
        "name": name != null ? name : null,
        "isActive": isActive != null ? isActive : false,
        "role": role != null ? role : null,
      };
}

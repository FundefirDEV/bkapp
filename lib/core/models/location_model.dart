import 'dart:convert';

List<dynamic> locationModelFromJson(List<dynamic> str) =>
    List<dynamic>.from(str.map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<dynamic> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  LocationModel({
    this.id,
    this.name,
    this.code,
    this.isActive,
    this.departaments,
  });

  int id;
  String name;
  String code;
  bool isActive;
  List<Departament> departaments;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        isActive: json["isActive"],
        departaments: List<Departament>.from(
            json["departaments"].map((x) => Departament.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "isActive": isActive,
        "departaments": List<dynamic>.from(departaments.map((x) => x.toJson())),
      };
}

class Departament {
  Departament({
    this.id,
    this.name,
    this.isActive,
    this.cities,
  });

  int id;
  String name;
  bool isActive;
  List<Departament> cities;

  factory Departament.fromJson(Map<String, dynamic> json) => Departament(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        cities: json["cities"] == null
            ? null
            : List<Departament>.from(
                json["cities"].map((x) => Departament.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "cities": cities == null
            ? null
            : List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

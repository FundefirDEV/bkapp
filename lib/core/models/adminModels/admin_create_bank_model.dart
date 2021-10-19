import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';

class PartnerModel {
  int city;
  String name;
  List<AdminCreateBankUser> users;

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'name': name,
      'users': List<dynamic>.from(users.map((x) => x.toJson()))
    };
  }
}

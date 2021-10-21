import 'package:bkapp_flutter/core/models/adminModels/admin_create_bank_user_model.dart';

class AdminCreateBankModel {
  int city;
  String bankName;
  List<AdminCreateBankUser> users;

  AdminCreateBankModel({this.city, this.bankName, this.users});

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'name': bankName,
      'users': List<dynamic>.from(users.map((x) => x.toJson()))
    };
  }
}

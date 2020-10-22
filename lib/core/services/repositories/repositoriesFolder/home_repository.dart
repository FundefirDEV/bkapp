import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class HomeRepository {
  final ApiProvider apiProvider;

  HomeRepository({@required this.apiProvider}) : assert(apiProvider != null);

  HomeRepository.test({@required this.apiProvider});

  Future<Map<String, dynamic>> detailBank(String token) async {
    final Map informationBkHome = await apiProvider.getInformationBkHome(token);
    return informationBkHome;
  }

  Future<Map<String, dynamic>> myShares(String token) async {
    final mySharesBk = await apiProvider.myShares(token);
    return mySharesBk;
  }

  Future<Map<String, dynamic>> myCredits(String token) async {
    final myCreditsBk = await apiProvider.myCredits(token);
    return myCreditsBk;
  }
}

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
}

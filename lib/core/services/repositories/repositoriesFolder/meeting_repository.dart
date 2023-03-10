import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:flutter/material.dart';

class MeetingRepository {
  MeetingRepository({@required this.apiProvider}) : assert(apiProvider != null);
  MeetingRepository.test({@required this.apiProvider});
  final ApiProvider apiProvider;

  Future<Map<String, dynamic>> infoMeeting(String token) async {
    final Map infoMeeting = await apiProvider.getMeeting(token);
    return infoMeeting;
  }

  Future<Map<String, dynamic>> generateMeetingClosed(String token) async {
    final Map infoMeeting = await apiProvider.postMeetingClosed(token);
    return infoMeeting;
  }

  Future<Map<String, dynamic>> creditsCurrentMeeting(String token) async =>
      await apiProvider.getCreditsCurrentMeeting(token);

  Future<Map<String, dynamic>> sharesCurrentMeeting(String token) async =>
      await apiProvider.getSharesCurrentMeeting(token);
}

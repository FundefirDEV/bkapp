class EnvironmentConfig {
  ///
  /// Url for service
  ///
  static const String API_URL = String.fromEnvironment('API_URL',
      defaultValue: "https://bkservicestage.fundefir-dev.com");
  // https://bkservicestage.fundefir-dev.com
  // https://bkservice.fundefir-dev.com
  // http://192.168.0.19:8888

  ///
  /// Environment PROD; QA; STAGE or DEV
  ///
  static const String ENV = String.fromEnvironment('ENV', defaultValue: "DEV");

  ///
  /// DSN for sentry
  ///
  static const String DSN_SENTRY = String.fromEnvironment('DSN_SENTRY',
      defaultValue:
          "https://a0fbbeb4e5b54038a445c62c8a313411@o306138.ingest.sentry.io/5320740");

  ///
  /// Mock for service, use only when the API service is not available
  ///
  @Deprecated('Prefer "API_URL", the mock url is temporally.')
  static const String API_URL_MOCK = String.fromEnvironment('API_URL_MOCK',
      defaultValue:
          "https://virtserver.swaggerhub.com/fundefir-org/bk_service/1.0.1");
}

class ApiEndpoints {
  ///
  /// Login for bk_services
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String login({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/login";
  }

  ///
  /// Register for bk_services
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String register({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/regsiter";
  }

  ///
  /// Send Sms for bk_services
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String validationCode({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/validation-code";
  }

  ///
  /// Validate Code for bk_services
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String validationConfirmCode({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/validation-code-confirm";
  }

  ///
  /// Get approvals for bk_services
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getApprovals({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/approvals";
  }

  ///
  /// Get information bk home
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getInformationBkHome({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/bank-detail";
  }

  ///
  /// Post register user
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postRegisterUser({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/register";
  }

  ///
  /// Post register user
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postNewBank({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/bank-creation";
  }

  /// Validate the partner phone
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getPartnerValidation({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/validate-user-phone";
  }

  /// Post buy shares
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postRequestBuyShare({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/request";
  }

  // REVIEW unificar con postRequestBuyShares
  static String postCreditRequest({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/request";
  }

  /// Post buy Approvals
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postApprovals({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/approvals";
  }

  // Get meeting
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getMeeting({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/meeting";
  }

  /// Get Rules Bank
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getBankRules({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/bank-rules";
  }

  /// GET partners info
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getPartners({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/partners";
  }

  /// POST invite partner
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postInvitePartner({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/partners";
  }

  /// POST meeting closed
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postMeetingClosed({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/meeting/close";
  }

  /// POST admin
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String postAdmin({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/admin";
  }

  /// GET my bank info
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getMyBankInfo({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/my-bank-info";
  }

  ///
  /// Get Location
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getLocation({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/location";
  }

  ///
  /// Get Profile
  ///
  /// @deprecated [baseUrl]: Base of endpoint, only for dev or temporal cases
  ///
  static String getProfile({@deprecated baseUrl}) {
    if (baseUrl == null) baseUrl = EnvironmentConfig.API_URL;
    return "$baseUrl/v3/profile";
  }
}

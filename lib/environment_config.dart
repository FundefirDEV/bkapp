class EnvironmentConfig {
  ///
  /// Url for service
  ///
  static const String API_URL = String.fromEnvironment('API_URL',
      defaultValue: "https://bkservice.fundefir-dev.com");

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
          "https://virtserver.swaggerhub.com/jairoFg12/bk_service/0.0.1");
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
}

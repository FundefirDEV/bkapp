class EnvironmentConfig {
  ///
  /// Url for service
  ///
  static const String API_URL = String.fromEnvironment('API_URL',
      defaultValue: "https://bkservice.fundefir-dev.com");

  ///
  /// Mock for service, use only when the API service is not available
  ///
  @Deprecated('Prefer "API_URL", the mock url is temporally.')
  static const String API_URL_MOCK = String.fromEnvironment('API_URL_MOCK',
      defaultValue:
          "https://virtserver.swaggerhub.com/jairoFg12/bk_service/0.0.1/v3");
}

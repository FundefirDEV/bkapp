import 'package:bkapp_flutter/core/services/api/api_provider.dart';
import 'package:bkapp_flutter/core/services/repositories/repositoriesFolder/profile_register_repository.dart';
import 'package:http/http.dart' as http;

import 'repositories.dart';

http.Client httpClient = http.Client();

final LoginRepository loginRepository =
    LoginRepository(apiProvider: ApiProvider(httpClient: httpClient));

final ValidationCodeRepository validationCodeRepository =
    ValidationCodeRepository(apiProvider: ApiProvider(httpClient: httpClient));

final ValidationCodeConfirmRepository validationCodeConfirmRepository =
    ValidationCodeConfirmRepository(
        apiProvider: ApiProvider(httpClient: httpClient));

final PartnerRepository partnerRepository =
    PartnerRepository(apiProvider: ApiProvider(httpClient: httpClient));

final ApprovalsRepository approvalsRepository =
    ApprovalsRepository(apiProvider: ApiProvider(httpClient: httpClient));

final HomeRepository homeRepository =
    HomeRepository(apiProvider: ApiProvider(httpClient: httpClient));

final ProfileRegisterRepository profileRegisterRepository =
    ProfileRegisterRepository(apiProvider: ApiProvider(httpClient: httpClient));

final ShareRepository shareRepository =
    ShareRepository(apiProvider: ApiProvider(httpClient: httpClient));

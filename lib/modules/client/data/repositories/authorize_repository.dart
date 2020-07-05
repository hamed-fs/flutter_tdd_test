import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart' as api;
import 'package:flutter_tdd_test/modules/client/domain/repositories/authorize_repository_contract.dart';

class AuthorizeRepository implements AuthorizeRepositoryContract {
  @override
  Future<Authorize> authorize(AuthorizeRequest request) =>
      api.Authorize.authorize(request);
}

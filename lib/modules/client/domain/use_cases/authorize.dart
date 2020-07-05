import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart' as api;
import 'package:flutter_tdd_test/modules/client/domain/repositories/authorize_repository_contract.dart';

class Authorize {
  final AuthorizeRepositoryContract repository;

  Authorize(this.repository);

  Future<api.Authorize> authorize(AuthorizeRequest request) =>
      repository.authorize(request);
}

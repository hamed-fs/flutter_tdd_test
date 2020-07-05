import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';

abstract class AuthorizeRepositoryContract {
  Future<Authorize> authorize(AuthorizeRequest request);
}

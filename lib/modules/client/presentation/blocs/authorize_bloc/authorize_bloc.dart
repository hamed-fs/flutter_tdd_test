import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/account/authorize/authorize.dart';
import 'package:flutter_deriv_api/api/account/authorize/exceptions/authorize_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_tdd_test/modules/client/domain/repositories/authorize_repository_contract.dart';
import 'package:meta/meta.dart';

part 'authorize_event.dart';
part 'authorize_state.dart';

class AuthorizeBloc extends Bloc<AuthorizeEvent, AuthorizeState> {
  AuthorizeBloc(this.repository) : super(AuthorizeInitial());

  final AuthorizeRepositoryContract repository;

  @override
  Stream<AuthorizeState> mapEventToState(
    AuthorizeEvent event,
  ) async* {
    if (event is AuthorizeUser) {
      try {
        Authorize result = await repository.authorize(event.request);

        yield (AuthorizeSucceed(result));
      } on AuthorizeException {
        yield AuthorizeFailed(AuthorizeException(message: 'Authorize Failed.'));
      }
    } else {
      yield AuthorizeFailed(AuthorizeException(message: 'Authorize Failed.'));
    }
  }
}

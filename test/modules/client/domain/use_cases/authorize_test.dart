import 'package:flutter_deriv_api/api/account/authorize/authorize.dart' as api;
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_tdd_test/modules/client/domain/repositories/authorize_repository_contract.dart';
import 'package:flutter_tdd_test/modules/client/domain/use_cases/authorize.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthorizeRepository extends Mock implements AuthorizeRepositoryContract {}

void main() {
  AuthorizeRepositoryContract repository;
  Authorize authorize;

  setUpAll(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    repository = MockAuthorizeRepository();
    authorize = Authorize(repository);
  });

  final api.Authorize response = api.Authorize(loginId: 'login_id');
  final AuthorizeRequest request = AuthorizeRequest(authorize: 'abc_123');

  group('Authorize Test =>', () {
    test('Successful Result.', () async {
      when(authorize.authorize(any)).thenAnswer(
        (_) async => response,
      );

      final result = await authorize.authorize(request);

      expect(result.loginId, response.loginId);
      verify(authorize.authorize(request));
      verifyNoMoreInteractions(repository);
    });
  });
}

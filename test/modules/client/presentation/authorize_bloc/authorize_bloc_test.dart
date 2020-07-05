import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_deriv_api/basic_api/generated/authorize_send.dart';
import 'package:flutter_tdd_test/modules/client/domain/repositories/authorize_repository_contract.dart';
import 'package:flutter_tdd_test/modules/client/presentation/blocs/authorize_bloc/authorize_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthorizeRepository extends Mock
    implements AuthorizeRepositoryContract {}

main() {
  AuthorizeRepositoryContract repository;

  setUpAll(() {
    repository = MockAuthorizeRepository();
  });

  final AuthorizeRequest request = AuthorizeRequest(authorize: 'abc_123');

  group('Authorize Bloc Test =>', () {
    blocTest(
      'Emits [] When Nothing is Added.',
      build: () async => AuthorizeBloc(repository),
      expect: [],
    );

    blocTest(
      'Emits [AuthorizeSucceed] When AuthorizeUser is Added.',
      build: () async => AuthorizeBloc(repository),
      act: (bloc) => bloc.add(AuthorizeUser(request)),
      expect: [isA<AuthorizeSucceed>()],
    );

    blocTest(
      'Bloc Throws Exception when null is added.',
      build: () async => AuthorizeBloc(repository),
      act: (bloc) => bloc.add(null),
      expect: [isA<AuthorizeFailed>()],
    );
  });
}

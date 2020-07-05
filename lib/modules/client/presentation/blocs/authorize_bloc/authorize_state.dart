part of 'authorize_bloc.dart';

@immutable
abstract class AuthorizeState {}

class AuthorizeInitial extends AuthorizeState {
  @override
  String toString() => runtimeType.toString();
}

class AuthorizeSucceed extends AuthorizeState {
  final Authorize result;

  AuthorizeSucceed(this.result);

  @override
  String toString() => runtimeType.toString();
}

class AuthorizeFailed extends AuthorizeState {
  final AuthorizeException exception;

  AuthorizeFailed(this.exception);

  @override
  String toString() => runtimeType.toString();
}

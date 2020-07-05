part of 'authorize_bloc.dart';

@immutable
abstract class AuthorizeEvent {}

class AuthorizeUser extends AuthorizeEvent {
  final AuthorizeRequest request;

  AuthorizeUser(this.request);

  @override
  String toString() => runtimeType.toString();
}

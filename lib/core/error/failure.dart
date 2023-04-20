import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];
  const Failure();

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}

class FailureWithMessage extends Failure {
  final String message;
  const FailureWithMessage({required this.message});
}

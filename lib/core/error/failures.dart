import 'package:equatable/equatable.dart';

/// Base class for all domain-level failures.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Local storage (Hive) failures.
class StorageFailure extends Failure {
  const StorageFailure([super.message = 'Storage error']);
}

/// Validation failures.
class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation error']);
}

/// Unexpected / unhandled failures.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Unexpected error']);
}

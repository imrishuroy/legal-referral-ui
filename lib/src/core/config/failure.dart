import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({
    this.statusCode,
    this.message = 'something went wrong',
  });
  final int? statusCode;
  final String message;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [statusCode, message];
}

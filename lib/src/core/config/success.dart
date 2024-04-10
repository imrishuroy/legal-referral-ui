import 'package:equatable/equatable.dart';

class Success extends Equatable {
  const Success({
    this.statusCode,
    this.result,
  });

  factory Success.fromJson(Map<String, dynamic> map) {
    return Success(
      result: map['result'] as String,
    );
  }
  final int? statusCode;
  final String? result;

  @override
  bool get stringify => true;

  Success copyWith({
    int? statusCode,
    String? message,
  }) {
    return Success(
      statusCode: statusCode ?? this.statusCode,
      result: message ?? result,
    );
  }

  @override
  List<Object?> get props => [statusCode, result];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'internet_check_bloc.dart';

enum InternetCheck { connected, disconnected, none }

class InternetCheckState extends Equatable {
  const InternetCheckState({
    required this.internetStatus,
    this.connectivityResult = ConnectivityResult.none,
    this.connectionMessage = '',
  });

  factory InternetCheckState.initial() =>
      const InternetCheckState(internetStatus: InternetCheck.none);

  final InternetCheck internetStatus;
  final String? connectionMessage;
  final ConnectivityResult? connectivityResult;

  @override
  List<Object?> get props => [connectionMessage, internetStatus];

  InternetCheckState copyWith({
    InternetCheck? internetStatus,
    String? connectionMessage,
    ConnectivityResult? connectivityResult,
  }) {
    return InternetCheckState(
      internetStatus: internetStatus ?? this.internetStatus,
      connectionMessage: connectionMessage ?? this.connectionMessage,
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }
}

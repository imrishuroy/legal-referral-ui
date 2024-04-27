part of 'internet_check_bloc.dart';

enum InternetCheck { connected, disconnected }

class InternetCheckState extends Equatable {
  const InternetCheckState({
    required this.internetStatus,
  });

  factory InternetCheckState.initial() => const InternetCheckState(
        internetStatus: InternetCheck.disconnected,
      );

  final InternetCheck internetStatus;

  @override
  List<Object?> get props => [
        internetStatus,
      ];

  InternetCheckState copyWith({
    InternetCheck? internetStatus,
  }) {
    return InternetCheckState(
      internetStatus: internetStatus ?? this.internetStatus,
    );
  }
}

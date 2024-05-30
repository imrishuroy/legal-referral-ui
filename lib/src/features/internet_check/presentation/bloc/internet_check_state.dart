part of 'internet_check_bloc.dart';

enum InternetCheck { connected, disconnected }

class InternetCheckState extends Equatable {
  const InternetCheckState({
    required this.internetStatus,
    required this.hasInternet,
  });

  factory InternetCheckState.initial() => const InternetCheckState(
        internetStatus: InternetCheck.disconnected,
        hasInternet: false,
      );

  final InternetCheck internetStatus;

  final bool hasInternet;

  @override
  List<Object> get props => [
        internetStatus,
        hasInternet,
      ];

  InternetCheckState copyWith({
    InternetCheck? internetStatus,
    bool? hasInternet,
  }) {
   
    return InternetCheckState(
      internetStatus: internetStatus ?? this.internetStatus,
      hasInternet: hasInternet ?? this.hasInternet,
    );
  }
}

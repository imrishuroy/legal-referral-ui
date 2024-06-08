part of 'feed_bloc.dart';

enum FeedStatus { initial, loading, success, failure }

class FeedState extends Equatable {
  const FeedState({
    required this.status,
    required this.feeds,
    this.failure,
  });

  factory FeedState.initial() => const FeedState(
        status: FeedStatus.initial,
        feeds: [],
      );

  final FeedStatus status;
  final List<Feed?> feeds;
  final Failure? failure;

  FeedState copyWith({
    FeedStatus? status,
    List<Feed?>? feeds,
    Failure? failure,
  }) {
    return FeedState(
      status: status ?? this.status,
      feeds: feeds ?? this.feeds,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        status,
        feeds,
        failure,
      ];
}

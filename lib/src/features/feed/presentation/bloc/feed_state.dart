part of 'feed_bloc.dart';

enum FeedStatus { initial, loading, success, failure }

class FeedState extends Equatable {
  const FeedState({
    required this.status,
    required this.feeds,
    this.offset = 1,
    this.hasReachedMax = false,
    this.failure,
  });

  factory FeedState.initial() => const FeedState(
        status: FeedStatus.initial,
        feeds: [],
      );

  final FeedStatus status;
  final int offset;
  final List<Feed?> feeds;
  final bool hasReachedMax;
  final Failure? failure;

  FeedState copyWith({
    FeedStatus? status,
    int? offset,
    List<Feed?>? feeds,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return FeedState(
      status: status ?? this.status,
      offset: offset ?? this.offset,
      feeds: feeds ?? this.feeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        status,
        offset,
        feeds,
        hasReachedMax,
        failure,
      ];
}
